#!/bin/bash

set -e
set -u
set -o pipefail

detectOSPlatform() {
	OSNAME=$(uname)

	if [[ "${OSNAME}" = "Darwin" ]]; then
	 	OSNAME=macosx
	elif [[ "${OSNAME}" = "Linux" ]]; then
		OSNAME=linux
	fi

	echo ${OSNAME}
}

OSNAME=${1:-$(detectOSPlatform)}

echo "Building uber jar for target platform: ${OSNAME}"
mvn package -Djavacpp.platform=${OSNAME}-x86_64