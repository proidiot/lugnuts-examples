#!/bin/sh

# Set failure non-zero exit codes (set -e)
# Set failure undefined variables (set -u)
set -eu

MESSAGE='Hello There!'
COMMAND_SPECIFIED='FALSE'

HELP_MSG="Usage: ./docker-init.sh [HYPHENATED-OPTIONS]
Usage: ./docker-init.sh COMMAND [COMMAND-OPTIONS]

Prints the message unless another command is specified.

Available Options:

	-h, --help
		Prints this help message.

	-e, --echo-message MESSAGE
		Override the message to be printed.
		Default: ${MESSAGE}

For more help, contact Charlie <proidiot at gmail dot com>
"

while [ $# -gt 0 ] && [ "x${COMMAND_SPECIFIED}" = 'xFALSE' ]
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
	-*)
		echo "Unknown option: ${1}" >&2
		echo "" >&2
		echo "${HELP_MSG}" >&2
		exit 1
		;;
	*)
		COMMAND_SPECIFIED='TRUE'
		;;
	esac

	if [ "x${COMMAND_SPECIFIED}" = 'xFALSE' ]
	then
		shift
	fi
done

if [ "x${COMMAND_SPECIFIED}" = 'xTRUE' ]
then
	exec $@
fi

echo "${MESSAGE}"

