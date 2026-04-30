#!/bin/bash

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
  echo "${items}" | awk 'BEGIN { RS="</item>" } /<item>/ { print $0 "</item>" }' | while read -r item; do
    # Extract uniquecontentid from <item> tag
    uniquecontentid=$(echo "${item}" | grep -o '<uniquecontentid>[^<]*</uniquecontentid>' | sed 's/<uniquecontentid>//g' | sed 's/<\/uniquecontentid>//g' | tr -d '[:space:]')

    # If uniquecontentid not found, try alternative parsing
    if [[ -z "${uniquecontentid}" ]]
    then
      uniquecontentid=$(echo "${item}" | sed 's/<item>//' | sed 's/<title>.*//' | tr -d '[:space:]' | sed 's/<\/uniquecontentid>//g')
    fi

    # Clean up uniquecontentid to remove any remaining XML tags
    uniquecontentid=$(echo "${uniquecontentid}" | sed 's/<[^>]*>//g' | tr -d '[:space:]')

    # Extract title and subtitle
    title=$(echo "${item}" | grep -o '<title>[^<]*</title>' | sed 's/<title>//g' | sed 's/<\/title>//g' | tr -d '[:space:]')
    subtitle=$(echo "${item}" | grep -o '<subtitle>[^<]*</subtitle>' | sed 's/<subtitle>//g' | sed 's/<\/subtitle>//g' | tr -d '[:space:]')

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
      files=$(aa list -i "${temp_dir}/${bundle_filename}" -include-type f 2>/dev/null | grep -v "^$")

      dirs=$(aa list -i "${temp_dir}/${bundle_filename}" -include-type d 2>/dev/null | grep -v "^$")

      unique_dirs=$(echo "${files}" | while IFS= read -r line; do
        if [[ -n "${line}" ]]
        then
          line=${line#/}
          dirname "${line}"
        fi
      done | sort | uniq)

      while IFS= read -r dir
      do
        aar_files=$(echo "${files}" | while IFS= read -r line; do
          if [[ -n "${line}" ]]
          then
            line=${line#/}
            if [[ "$(dirname "${line}")" == "${dir}" ]]
            then
              basename "${line}"
            fi
          fi
        done | sort)

        if [[ "${dir}" == "." ]]
        then
          while IFS= read -r file
          do
            if [[ -n "${file}" ]]
            then
              trash_paths+=("${HOME}/Music/Logic Pro Library.bundle/${file}")
            fi
          done <<<"${aar_files}"
        else
          bundle_dir="${HOME}/Music/Logic Pro Library.bundle/${dir}"
          if [[ -d "${bundle_dir}" ]]
          then
            bundle_files=$(find "${bundle_dir}" -type f -exec basename {} \; | sort)

            bundle_subdirs=$(find "${bundle_dir}" -type d -exec basename {} \; | sort)

            aar_subdirs=$(echo "${dirs}" | grep "^${dir}/" | sed "s|^${dir}/||" | sort)

            if [[ "${aar_files}" == "${bundle_files}" && "${aar_subdirs}" == "${bundle_subdirs}" ]]
            then
              trash_paths+=("${bundle_dir}")
            else
              while IFS= read -r file
              do
                if [[ -n "${file}" ]]
                then
                  trash_paths+=("${bundle_dir}/${file}")
                fi
              done <<<"${aar_files}"
            fi
          else
            while IFS= read -r file
            do
              if [[ -n "${file}" ]]
              then
                trash_paths+=("${bundle_dir}/${file}")
              fi
            done <<<"${aar_files}"
          fi
        fi
      done <<<"${unique_dirs}"
    fi

    rm -rf "${temp_dir}"

    if [[ ${#trash_paths[@]} -eq 0 ]]
    then
      trash_paths=("${HOME}/Music/Logic Pro Library.bundle/Apple Loops/${display_name}" "${HOME}/Music/Logic Pro Library.bundle/Application Support/Package Definitions/${bundle_name}.plist")
    fi

    trash_list=""
    for path in "${trash_paths[@]}"
    do
      escaped_path=$(echo "${path}" | sed 's/"/\\"/g')
      trash_list+="    \"${escaped_path}\",\n"
    done
    trash_list=${trash_list%\n}

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
  done
done

count=$(cat "${counter_file}")
rm "${counter_file}"

echo "Completed! Generated ${count} Cask files in ${casks_dir} directory"
