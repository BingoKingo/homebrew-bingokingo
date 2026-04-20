#!/bin/bash

casks_dir="$(dirname "$0")/../Casks/musicapps"
if [[ ! -d "${casks_dir}" ]]
then
  mkdir -p "${casks_dir}"
fi

plist_urls=(
  "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/garageband10412.plist"
  "https://audiocontentdownload.apple.com/lp10_ms3_content_2016/logicpro1120.plist"
)

counter_file=$(mktemp)
echo 0 >"${counter_file}"

for plist_url in "${plist_urls[@]}"
do
  plist_filename=$(basename "${plist_url}")
  plist_file="/tmp/${plist_filename}"

  echo "Downloading ${plist_filename} file from ${plist_url}..."
  curl -s -o "${plist_file}" "${plist_url}"

  if [[ ! -f "${plist_file}" ]]
  then
    echo "Failed to download ${plist_filename} file"
    continue
  fi

  echo "Parsing ${plist_filename} file..."
  package_keys=$(plutil -convert xml1 -o - "${plist_file}" | xmllint --xpath "//key[text()='Packages']/following-sibling::dict[1]//key/text()" - 2>/dev/null)

  echo "Found $(echo "${package_keys}" | wc -l) packages in Packages dictionary"

  echo "${package_keys}" | while read -r package_key; do
    download_name=$(plutil -convert xml1 -o - "${plist_file}" | xmllint --xpath "//key[text()='Packages']/following-sibling::dict[1]//key[text()='${package_key}']/following-sibling::dict[1]//key[text()='DownloadName']/following-sibling::string[1]/text()" - 2>/dev/null)
    package_id=$(plutil -convert xml1 -o - "${plist_file}" | xmllint --xpath "//key[text()='Packages']/following-sibling::dict[1]//key[text()='${package_key}']/following-sibling::dict[1]//key[text()='PackageID']/following-sibling::string[1]/text()" - 2>/dev/null)

    if [[ -z "${download_name}" ]] || [[ -z "${package_id}" ]]
    then
      continue
    fi

    packages_xml=$(plutil -convert xml1 -o - "${plist_file}" | xmllint --xpath "//key[text()='Packages']/following-sibling::dict[1]" -)
    package_xml=$(echo "${packages_xml}" | awk -v pkg="${package_key}" 'BEGIN {found=0;} {if (index($0, "<key>" pkg "</key>") != 0) {found=1; print; next;}} found && /<\/dict>/{print; exit;} found {print;}')
    true_keys=""
    while read -r key
    do
      if [[ -n "${key}" ]]
      then
        if [[ -n "${true_keys}" ]]
        then
          true_keys="${true_keys}, ${key}"
        else
          true_keys="${key}"
        fi
      fi
    done < <(echo "${package_xml}" | grep -B 1 "<true/>" | grep "<key>" | sed 's/<key>//g' | sed 's/<\/key>//g' | sed 's/^[[:space:]]*//' | sed 's/[[:space:]]*$//' | sort -u)

    cask_name=$(echo "${package_id}" | sed 's/com.apple.pkg.//' | tr '[:upper:]' '[:lower:]' | tr '_' '-')
    cask_file="${casks_dir}/${cask_name}.rb"

    if [[ -f "${cask_file}" ]]
    then
      echo "Skipping ${cask_file} (already exists)"
      continue
    fi

    if [[ "${download_name}" == ../* ]]
    then
      relative_path=$(echo "${download_name}" | sed 's/^\.\.\///')
      full_url="https://audiocontentdownload.apple.com/${relative_path}"
    else
      full_url="https://audiocontentdownload.apple.com/lp10_ms3_content_2016/${download_name}"
    fi

    etag=$(curl -s -I "${full_url}" | grep -i etag | awk -F '"' '{print $2}' | tr '[:upper:]' '[:lower:]')
    if [[ -z "${etag}" ]]
    then
      etag="unknown"
    fi

    if [[ -n "${true_keys}" ]]
    then
      cat >"${cask_file}" <<EOF
cask "${cask_name}" do
  version "${etag}"
  sha256 :no_check

  url "${full_url}"
  name "${package_key}"
  desc "${true_keys}"
  homepage "https://audiocontentdownload.apple.com/"

  livecheck do
    url "${full_url}"
    strategy :header_match do |headers|
      etag = headers["etag"]
      return unless etag
      etag = etag.delete_prefix('"')
      etag = etag.delete_suffix('"')
      etag.downcase
    end
  end

  pkg "$(basename "${download_name}")"

  uninstall pkgutil: "${package_id}"
end
EOF
    else
      cat >"${cask_file}" <<EOF
cask "${cask_name}" do
  version "${etag}"
  sha256 :no_check

  url "${full_url}"
  name "${package_key}"
  homepage "https://audiocontentdownload.apple.com/"

  livecheck do
    url "${full_url}"
    strategy :header_match do |headers|
      etag = headers["etag"]
      return unless etag
      etag = etag.delete_prefix('"')
      etag = etag.delete_suffix('"')
      etag.downcase
    end
  end

  pkg "$(basename "${download_name}")"

  uninstall pkgutil: "${package_id}"
end
EOF
    fi

    count=$(cat "${counter_file}")
    count=$((count + 1))
    echo "${count}" >"${counter_file}"
    echo "Generated ${cask_file}"
  done
done

count=$(cat "${counter_file}")
rm "${counter_file}"

echo "Completed! Generated ${count} Cask files in ${casks_dir} directory"
