#!/bin/sh

# Set failure non-zero exit codes (set -e)
# Set failure undefined variables (set -u)
set -eu

MESSAGE='Hello There!'

HELP_MSG="Usage: ./example.sh [OPTIONS]

Prints the message.

Available Options:

	-h, --help
		Prints this help message.

	-e, --echo-message MESSAGE
		Override the message to be printed.
		Default: ${MESSAGE}

For more help, contact Charlie <proidiot at gmail dot com>
"

while [ $# -gt 0 ]
do
	case $1 in
	-h|--help)
		echo "${HELP_MSG}"
		exit 0
		;;
	-e|--echo-message)
		shift
		MESSAGE="${1}"
		;;
	*)
		echo "Unknown option: ${1}" >&2
		echo "" >&2
		echo "${HELP_MSG}" >&2
		exit 1
		;;
	esac
	shift
done

echo "${MESSAGE}"

