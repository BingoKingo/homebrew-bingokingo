#!/bin/bash

casks_dir="$(dirname "$0")/../Casks/musicapps"
mkdir -p "${casks_dir}"
counter_file=$(mktemp)

urls=(
  "https://audiocontentdownload.apple.com/ltp/en/basicguitar.html"
  "https://audiocontentdownload.apple.com/ltp/en/rockguitar.html"
  "https://audiocontentdownload.apple.com/ltp/en/bluesguitar.html"
  "https://audiocontentdownload.apple.com/ltp/en/basicpiano.html"
  "https://audiocontentdownload.apple.com/ltp/en/poppiano.html"
  "https://audiocontentdownload.apple.com/ltp/en/classicalpiano.html"
  "https://audiocontentdownload.apple.com/ltp/en/bubbly.html"
  "https://audiocontentdownload.apple.com/ltp/en/limelight.html"
  "https://audiocontentdownload.apple.com/ltp/en/tomsawyer.html"
  "https://audiocontentdownload.apple.com/ltp/en/workingman.html"
  "https://audiocontentdownload.apple.com/ltp/en/spiritofradio.html"
  "https://audiocontentdownload.apple.com/ltp/en/idontcare.html"
  "https://audiocontentdownload.apple.com/ltp/en/sugar.html"
  "https://audiocontentdownload.apple.com/ltp/en/soulmeetsbody.html"
  "https://audiocontentdownload.apple.com/ltp/en/iwillfollowyou.html"
  "https://audiocontentdownload.apple.com/ltp/en/horsewithnoname.html"
  "https://audiocontentdownload.apple.com/ltp/en/sistergoldenhair.html"
  "https://audiocontentdownload.apple.com/ltp/en/venturahighway.html"
  "https://audiocontentdownload.apple.com/ltp/en/pullingmussels.html"
  "https://audiocontentdownload.apple.com/ltp/en/blackcoffee.html"
  "https://audiocontentdownload.apple.com/ltp/en/ordinarypeople.html"
  "https://audiocontentdownload.apple.com/ltp/en/lovesong.html"
  "https://audiocontentdownload.apple.com/ltp/en/apologize.html"
  "https://audiocontentdownload.apple.com/ltp/en/thinkingaboutyou.html"
  "https://audiocontentdownload.apple.com/ltp/en/brick.html"
  "https://audiocontentdownload.apple.com/ltp/en/zakandsara.html"
  "https://audiocontentdownload.apple.com/ltp/en/angel.html"
  "https://audiocontentdownload.apple.com/ltp/en/iwillpossessyourheart.html"
)

echo 0 >"${counter_file}"

for url in "${urls[@]}"
do
  echo "Processing: ${url}"

  page_content=$(curl -s "${url}")
  download_links=$(echo "${page_content}" | grep -o 'class="downloadlink"[^>]*href="\([^"]*\)"' | sed 's/class="downloadlink"[^>]*href="\(.*\)"/\1/')

  link_count=$(echo "${download_links}" | grep -c '^')
  echo "Found ${link_count} download links"

  echo "${download_links}" | while read -r link; do
    if [[ -z "${link}" ]]
    then
      continue
    fi

    context=$(echo "${page_content}" | grep -B 5 -A 5 "${link}")
    desc=$(echo "${context}" | grep -E '<td[^>]*>' | sed -n '2p' | sed 's/<[^>]*>//g' | sed 's/^[[:space:]]*//' | sed 's/[[:space:]]*$//')

    if [[ -z "${desc}" || "${desc}" == "Download" ]]
    then
      desc=$(echo "${page_content}" | grep -A 3 'class="artistpreviewtext"' | grep '<p>' | head -n 1 | sed 's/<[^>]*>//g' | sed 's/^[[:space:]]*//' | sed 's/[[:space:]]*$//')
    fi

    full_url=$(echo "${link}" | sed 's/gb-install:\/\//https:\/\//')

    encoded_url=$(printf "%s" "${full_url}" | python3 -c "import urllib.parse, sys; print(urllib.parse.quote(sys.stdin.read().strip(), safe=':/'))")

    decoded_url=$(printf "%s" "${full_url}" | python3 -c "import urllib.parse, sys; print(urllib.parse.unquote(sys.stdin.read().strip()))")
    package_name=$(echo "${decoded_url}" | awk -F '/' '{print $NF}')

    cask_name=$(echo "${package_name}" | sed 's/\.pkg$//' | tr ' ' '-' | tr '_' '-' | tr -d ',' | tr '[:upper:]' '[:lower:]' | sed "s/'//g" | awk '{gsub(/\-+/, "-"); print}')

    package_id="com.apple.pkg.${package_name%.pkg}"

    cask_file="${casks_dir}/${cask_name}.rb"

    if [[ -f "${cask_file}" ]]
    then
      echo "Skipping ${cask_file} (already exists)"
      continue
    fi

    etag=$(curl -s -I "${full_url}" | grep -i etag | awk -F '"' '{print $2}' | tr '[:upper:]' '[:lower:]')
    if [[ -z "${etag}" ]]
    then
      etag="unknown"
    fi

    if [[ -z "${desc}" ]]
    then
      desc=$(echo "${page_content}" | grep -A 3 'class="artistpreviewtext"' | grep '<p>' | head -n 1 | sed 's/<[^>]*>//g' | sed 's/^[[:space:]]*//' | sed 's/[[:space:]]*$//')
    fi

    if [[ -n "${desc}" ]]
    then
      desc=$(echo "${desc}" | tr -d '"'\''')
      desc=$(echo "${desc}" | cut -c 1-80)
    fi

    if [[ -n "${desc}" ]]
    then
      cat >"${cask_file}" <<EOF
cask "${cask_name}" do
  version "${etag}"
  sha256 :no_check

  url "${encoded_url}"
  name "${package_name%.pkg}"
  desc "${desc}"
  homepage "${url}"

  livecheck do
    url "${encoded_url}"
    strategy :header_match do |headers|
      etag = headers["etag"]
      return unless etag
      etag = etag.delete_prefix('"')
      etag = etag.delete_suffix('"')
      etag.downcase
    end
  end

  pkg "${package_name}"

  uninstall pkgutil: "${package_id}"
end
EOF
    else
      cat >"${cask_file}" <<EOF
cask "${cask_name}" do
  version "${etag}"
  sha256 :no_check

  url "${encoded_url}"
  name "${package_name}"
  homepage "${url}"

  livecheck do
    url "${encoded_url}"
    strategy :header_match do |headers|
      etag = headers["etag"]
      return unless etag
      etag = etag.delete_prefix('"')
      etag = etag.delete_suffix('"')
      etag.downcase
    end
  end

  pkg "${package_name}"

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
