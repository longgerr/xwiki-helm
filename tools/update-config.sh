#!/usr/bin/env bash

# set -o errexit
# set -o pipefail
# set -o nounset
# set -o xtrace

# Set magic variables for current file & dir
__dir="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
__file="${__dir}/$(basename "${BASH_SOURCE[0]}")"
__base="$(basename ${__file} .sh)"
__root="$(cd "$(dirname "${__dir}")" && pwd)" # <-- change this as it depends on your app

# $1 - the path to xwiki.[cfg|properties]
# $2 - the setting/property to set
# $3 - the new value
function xwiki_replace() {
  sed -i s~"\#\? \?$2 \?=.*"~"$2=$3"~g "$1"
}

# $1 - the setting/property to set
# $2 - the new value
function xwiki_set_cfg() {
  xwiki_replace "${XWIKI_DATA_ROOT}/xwiki.cfg" "$1" "$2"
}

# $1 - the setting/property to set
# $2 - the new value
function xwiki_set_properties() {
  xwiki_replace "${XWIKI_DATA_ROOT}/xwiki.properties" "$1" "$2"
}

# Allows to use sed but with user input which can contain special sed characters such as \, / or &.
# $1 - the text to search for
# $2 - the replacement text
# $3 - the file in which to do the search/replace
function safesed {
  sed -i "s/$(echo $1 | sed -e 's/\([[\/.*]\|\]\)/\\&/g')/$(echo $2 | sed -e 's/[\/&]/\\&/g')/g" $3
}


# Reads the input arguments
while [ "$1" != "" ]; do
    case $1 in
        -c | --config-file ) shift
            CONFIG_FILE=$1
            ;;
        -a | --attribute ) shift
            CONFIG_ATTRIBUTE=$1
            ;;
        -v | --value ) shift
            CONFIG_VALUE=$1
            ;;
        -r | --data-root ) shift
            XWIKI_DATA_ROOT=$1
            ;;
    esac
    shift
done

if [ -z "${XWIKI_DATA_ROOT}" ]; then
    XWIKI_DATA_ROOT="/usr/local/xwiki/data"
fi

if [ -z "${CONFIG_FILE}" ]; then
    echo "--config-file is mandatory"
    exit 1
fi

if [ -z "${CONFIG_ATTRIBUTE}" ]; then
    echo "--attribute is mandatory"
    exit 1
fi

if [ "xwiki.cfg" == "${CONFIG_FILE}" ]; then
    echo "Set config to file ${CONFIG_FILE}, key: ${CONFIG_ATTRIBUTE}, value: ${CONFIG_VALUE}"
    xwiki_set_cfg "${CONFIG_ATTRIBUTE}" "${CONFIG_VALUE}"
fi