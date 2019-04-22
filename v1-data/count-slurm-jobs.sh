#!/usr/bin/bash -
#
# count-slurm-jobs.sh - count the number of slurm jobs for the current user
#
# Copyright (c) 2019 by Landon Curt Noll.  All Rights Reserved.
#
# Permission to use, copy, modify, and distribute this software and
# its documentation for any purpose and without fee is hereby granted,
# provided that the above copyright, this permission notice and text
# this comment, and the disclaimer below appear in all of the following:
#
#       supporting documentation
#       source copies
#       source works derived from this source
#       binaries derived from this source or from derived source
#
# LANDON CURT NOLL DISCLAIMS ALL WARRANTIES WITH REGARD TO THIS SOFTWARE,
# INCLUDING ALL IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS. IN NO
# EVENT SHALL LANDON CURT NOLL BE LIABLE FOR ANY SPECIAL, INDIRECT OR
# CONSEQUENTIAL DAMAGES OR ANY DAMAGES WHATSOEVER RESULTING FROM LOSS OF
# USE, DATA OR PROFITS, WHETHER IN AN ACTION OF CONTRACT, NEGLIGENCE OR
# OTHER TORTIOUS ACTION, ARISING OUT OF OR IN CONNECTION WITH THE USE OR
# PERFORMANCE OF THIS SOFTWARE.
#
# chongo (Landon Curt Noll, http://www.isthe.com/chongo/index.html) /\oo/\
#
# Share and enjoy! :-)

# parse args
#
export USAGE="usage: $0 [-h]

    -h		print help and exit 0"
export FORCE=
while getopts :h flag; do
    case "$flag" in
    h)  echo "$USAGE" 1>&2
	exit 0
	;;
    \?) echo "$0: invalid option: -$OPTARG" 1>&2
	echo "$USAGE" 1>&2
	exit 1
	;;
    :)  echo "$0: option -$OPTARG requires an argument" 1>&2
	echo "$USAGE" 1>&2
	exit 1
	;;
    esac
done
shift $(( OPTIND - 1 ));
if [[ $# -ne 0 ]]; then
    echo "$0: expected 0 args" 1>&2
    echo "$USAGE" 1>&2
    exit 1
fi

# firewall
#
export SQUEUE=$(which squeue)
if [[ -z $SQUEUE ]]; then
    echo "$0: FATAL: cannot find the squeue executable" 1>&2
    exit 2
fi

# determine username if needed
#
if [[ -z $USER ]]; then
    export USER=$(id -u -n)
fi
if [[ -z $USER ]]; then
    echo "$0: FATAL: cannot determine username" 1>&2
    exit 3
fi

# report on the number of queued jobs for this user
#
"$SQUEUE" --noheader --user="$USER" | wc -l

# All Done!!! - Jessica Noll, Age 2
#
exit 0
