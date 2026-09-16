#!/usr/bin/env bash

set -a
export PATH="/bin:/sbin:/usr/bin:/usr/sbin:/usr/local/bin:/usr/local/sbin${PATH:+:${PATH}}"
set +a

newline=$'\n'

casks_dir="$(dirname "$0")/../Casks/musicapps"
if [[ ! -d "${casks_dir}" ]]
then
  mkdir -p "${casks_dir}"
fi

rss_urls=(
  "https://audiocontentdownload.apple.com/universal/RSS_3/en.lproj/ArtistProducerPacksContentDownloadFeed.rss"
  "https://audiocontentdownload.apple.com/universal/RSS_3/en.lproj/StarterCompatibilityPacksContentDownloadFeed.rss"
  "https://audiocontentdownload.apple.com/universal/RSS_3/en.lproj/InstrumentPacksContentDownloadFeed.rss"
  "https://audiocontentdownload.apple.com/universal/RSS_3/en.lproj/DrummersKitsPacksContentDownloadFeed.rss"
  "https://audiocontentdownload.apple.com/universal/RSS_3/en.lproj/SoundPacksContentDownloadFeed.rss"
)

counter_file=$(mktemp)
echo 0 >"${counter_file}"

for rss_url in "${rss_urls[@]}"
do
  echo "Processing RSS: ${rss_url}"

  rss_content=$(curl -s "${rss_url}")

  if [[ -z "${rss_content}" ]]
  then
    echo "Failed to download RSS content"
    continue
  fi

  # Debug: save RSS content to file
  echo "${rss_content}" >"/tmp/rss_debug.xml"
  echo "Saved RSS content to /tmp/rss_debug.xml"

  # Try different ways to extract items
  items=$(echo "${rss_content}" | grep -o '<item>.*</item>' -s)

  if [[ -z "${items}" ]]
  then
    # Try with multiline matching
    items=$(echo "${rss_content}" | awk '/<item>/,/<\/item>/' | tr '\n' ' ')
  fi

  if [[ -z "${items}" ]]
  then
    echo "No items found in RSS"
    continue
  fi

  # Count items
  item_count=$(echo "${items}" | grep -o '<item>' | wc -l)
  echo "Found ${item_count} items in RSS"

  # Process each item separately using awk
  items_file=$(mktemp)
  echo "${items}" | awk 'BEGIN { RS="</item>" } /<item>/ { print $0 "</item>" }' >"${items_file}"
  while read -r item
  do
    # Extract uniquecontentid from <item> tag
    _raw=$(printf '%s' "${item}" | grep -o '<uniquecontentid>[^<]*</uniquecontentid>')
    uniquecontentid=${_raw#<uniquecontentid>}
    uniquecontentid=${uniquecontentid%</uniquecontentid>}
    uniquecontentid=$(printf '%s' "${uniquecontentid}" | tr -d '[:space:]')

    # If uniquecontentid not found, try alternative parsing
    if [[ -z "${uniquecontentid}" ]]
    then
      _alt=${item#*<item>}
      _alt=${_alt%%<title>*}
      uniquecontentid=$(printf '%s' "${_alt}" | tr -d '[:space:]')
    fi

    # Clean up uniquecontentid to remove any remaining XML tags
    uniquecontentid=${uniquecontentid//<[^>]*>/}
    uniquecontentid=$(printf '%s' "${uniquecontentid}" | tr -d '[:space:]')

    # Extract title and subtitle
    _rtitle=$(printf '%s' "${item}" | grep -o '<title>[^<]*</title>')
    title=${_rtitle#<title>}
    title=${title%</title>}
    title=$(printf '%s' "${title}" | tr -d '[:space:]')

    _rsub=$(printf '%s' "${item}" | grep -o '<subtitle>[^<]*</subtitle>')
    subtitle=${_rsub#<subtitle>}
    subtitle=${subtitle%</subtitle>}
    subtitle=$(printf '%s' "${subtitle}" | tr -d '[:space:]')

    if [[ -z "${uniquecontentid}" ]]
    then
      continue
    fi

    bundle_name="${uniquecontentid}"
    bundle_filename="${bundle_name}.aar"
    bundle_url="https://audiocontentdownload.apple.com/universal/ContentPacks_3/${bundle_name}/${bundle_filename}"

    cask_name=$(echo "${bundle_name}" | tr '_' '-' | tr '[:upper:]' '[:lower:]' | cut -c 1-100)
    cask_file="${casks_dir}/${cask_name}.rb"

    if [[ -f "${cask_file}" ]]
    then
      echo "Skipping ${cask_file} (already exists)"
      continue
    fi

    etag=$(curl -s -I "${bundle_url}" | grep -i etag | awk -F '"' '{print $2}' | tr '[:upper:]' '[:lower:]')
    if [[ -z "${etag}" ]]
    then
      etag="unknown"
    fi

    display_name="${title}"
    desc="${subtitle}"

    temp_dir=$(mktemp -d)
    curl -s -o "${temp_dir}/${bundle_filename}" "${bundle_url}"

    trash_paths=()
    if [[ -f "${temp_dir}/${bundle_filename}" ]]
    then
      files_file=$(mktemp)
      aa list -i "${temp_dir}/${bundle_filename}" -include-type f 2>/dev/null | grep -v "^$" >"${files_file}"

      dirs_file=$(mktemp)
      aa list -i "${temp_dir}/${bundle_filename}" -include-type d 2>/dev/null | grep -v "^$" >"${dirs_file}"

      unique_dirs_file=$(mktemp)
      while IFS= read -r line
      do
        if [[ -n "${line}" ]]
        then
          line=${line#/}
          dirname "${line}"
        fi
      done <"${files_file}" | sort -u >"${unique_dirs_file}"

      while IFS= read -r dir
      do
        aar_files_file=$(mktemp)
        while IFS= read -r line
        do
          if [[ -n "${line}" ]]
          then
            line=${line#/}
            if [[ "$(dirname "${line}")" == "${dir}" ]]
            then
              basename "${line}"
            fi
          fi
        done <"${files_file}" | sort >"${aar_files_file}"

        if [[ "${dir}" == "." ]]
        then
          while IFS= read -r file
          do
            if [[ -n "${file}" ]]
            then
              trash_paths+=("${HOME}/Music/Logic Pro Library.bundle/${file}")
            fi
          done <"${aar_files_file}"
        else
          bundle_dir="${HOME}/Music/Logic Pro Library.bundle/${dir}"
          if [[ -d "${bundle_dir}" ]]
          then
            bundle_files_file=$(mktemp)
            find "${bundle_dir}" -type f ! -name ".DS_Store" -exec basename {} \; | sort >"${bundle_files_file}"

            bundle_subdirs_file=$(mktemp)
            find "${bundle_dir}" -mindepth 1 -type d ! -name ".DS_Store" -exec basename {} \; | sort >"${bundle_subdirs_file}"

            aar_subdirs_file=$(mktemp)
            grep "^${dir}/" "${dirs_file}" | sed "s|^${dir}/||" | sort >"${aar_subdirs_file}"

            aar_files_count=$(wc -l <"${aar_files_file}")
            bundle_files_count=$(wc -l <"${bundle_files_file}")
            aar_subdirs_count=$(wc -l <"${aar_subdirs_file}")
            bundle_subdirs_count=$(wc -l <"${bundle_subdirs_file}")

            if [[ "${aar_files_count}" -eq "${bundle_files_count}" && "${aar_subdirs_count}" -eq "${bundle_subdirs_count}" ]]
            then
              files_match=true
              while IFS= read -r aar_file && IFS= read -r bundle_file <&3
              do
                if [[ "${aar_file}" != "${bundle_file}" ]]
                then
                  files_match=false
                  break
                fi
              done 3<"${bundle_files_file}" <"${aar_files_file}"

              dirs_match=true
              while IFS= read -r aar_subdir && IFS= read -r bundle_subdir <&3
              do
                if [[ "${aar_subdir}" != "${bundle_subdir}" ]]
                then
                  dirs_match=false
                  break
                fi
              done 3<"${bundle_subdirs_file}" <"${aar_subdirs_file}"

              rm -f "${bundle_files_file}" "${bundle_subdirs_file}" "${aar_subdirs_file}"

              if [[ "${files_match}" == true && "${dirs_match}" == true ]]
              then
                trash_paths+=("${bundle_dir}")
                rm -f "${aar_files_file}"
                continue
              fi
            else
              rm -f "${bundle_files_file}" "${bundle_subdirs_file}" "${aar_subdirs_file}"
            fi

            while IFS= read -r file
            do
              if [[ -n "${file}" ]]
              then
                trash_paths+=("${bundle_dir}/${file}")
              fi
            done <"${aar_files_file}"
          else
            while IFS= read -r file
            do
              if [[ -n "${file}" ]]
              then
                trash_paths+=("${bundle_dir}/${file}")
              fi
            done <"${aar_files_file}"
          fi
          rm -f "${aar_files_file}"
        fi
      done <"${unique_dirs_file}"

      rm -f "${files_file}" "${dirs_file}" "${unique_dirs_file}"
    fi

    if [[ ${#trash_paths[@]} -gt 0 ]]
    then
      trash_paths_sorted=$(mktemp)
      printf "%s\n" "${trash_paths[@]}" | sort -u >"${trash_paths_sorted}"
      trash_paths=()
      while IFS= read -r path
      do
        trash_paths+=("${path}")
      done <"${trash_paths_sorted}"
      rm -f "${trash_paths_sorted}"
    fi

    rm -rf "${temp_dir}"

    if [[ ${#trash_paths[@]} -eq 0 ]]
    then
      trash_paths=("${HOME}/Music/Logic Pro Library.bundle/Apple Loops/${display_name}" "${HOME}/Music/Logic Pro Library.bundle/Application Support/Package Definitions/${bundle_name}.plist")
    fi

    trash_list=""
    for path in "${trash_paths[@]}"
    do
      escaped_path="${path//\"/\\\"}"
      trash_list+="    \"${escaped_path}\",${newline}"
    done
    trash_list=${trash_list%"${newline}"}

    if [[ -n "${desc}" ]]
    then
      cat >"${cask_file}" <<EOF
cask "${cask_name}" do
  version "${etag}"
  sha256 :no_check

  url "${bundle_url}"
  name "${display_name}"
  desc "${desc}"
  homepage "https://audiocontentdownload.apple.com/"

  livecheck do
    url "${bundle_url}"
    strategy :header_match do |headers|
      etag = headers["etag"]
      return unless etag

      etag = etag.delete_prefix('"')
      etag = etag.delete_suffix('"')
      etag.downcase
    end
  end

  preflight do
    require "fileutils"
    target_dir = File.expand_path("~/Music/Logic Pro Library.bundle")
    FileUtils.mkdir_p(target_dir)
    system "aa", "extract", "-i", File.join(staged_path, "${bundle_filename}").to_s, "-d",
           target_dir
  end

  zap trash: [
${trash_list}
  ]
end
EOF
    else
      cat >"${cask_file}" <<EOF
cask "${cask_name}" do
  version "${etag}"
  sha256 :no_check

  url "${bundle_url}"
  name "${display_name}"
  homepage "https://audiocontentdownload.apple.com/"

  livecheck do
    url "${bundle_url}"
    strategy :header_match do |headers|
      etag = headers["etag"]
      return unless etag

      etag = etag.delete_prefix('"')
      etag = etag.delete_suffix('"')
      etag.downcase
    end
  end

  preflight do
    require "fileutils"
    target_dir = File.expand_path("~/Music/Logic Pro Library.bundle")
    FileUtils.mkdir_p(target_dir)
    system "aa", "extract", "-i", File.join(staged_path, "${bundle_filename}").to_s, "-d",
           target_dir
  end

  zap trash: [
${trash_list}
  ]
end
EOF
    fi

    count=$(cat "${counter_file}")
    count=$((count + 1))
    echo "${count}" >"${counter_file}"
    echo "Generated ${cask_file}"
    ls -la "${cask_file}"
  done <"${items_file}"
  rm "${items_file}"
done

count=$(cat "${counter_file}")
rm "${counter_file}"

echo "Completed! Generated ${count} Cask files in ${casks_dir} directory"
