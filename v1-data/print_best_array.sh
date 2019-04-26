#!/bin/bash
#
# print_best_array.sh - generate the best arrays for jacobi-gentally.c from tally files
#
# Without -p:
#
# The best_v1_reverse_sorted_by_v1[] is sorted by valid v(1) value.
# For best_v1_reverse_sorted_by_v1[] (expect the for formatting and final -1) use:
#
#      cat job.dir/tally.1stint |
#          sed -e '/^#/d' -e '/^0 /d' | fld 2 |
#          sort -n |
#          tr '\012' ',' | sed -e 's/,$//' -e 's/,/, /g' -e 's/$/,/'
#
# The best_v1_reverse_sorted_by_oddv1[] is odd sorted by valid v(1) value.
# For best_v1_reverse_sorted_by_oddv1[] (expect the for formatting and final -1) use:
#
#      cat job.dir/tally.1stodd |
#          sed -e '/^#/d' -e '/^0 /d' | fld 2 |
#          sort -n |
#          tr '\012' ',' | sed -e 's/,$//' -e 's/,/, /g' -e 's/$/,/'
#
# The best_v1_reverse_sorted_by_freq[] is sorted in reverse order by count.
# For best_v1_reverse_sorted_by_freq[] (expect the for formatting and final -1) use:
#
#      cat job.dir/tally.1stint |
#          sed -e '/^#/d' -e '/^0 /d' | fld 2 |
#          tr '\012' ',' | sed -e 's/,$//' -e 's/,/, /g' -e 's/$/,/'
#
# The best_v1_reverse_sorted_by_oddfreq[] is odd sorted in reverse order by count.
# For best_v1_reverse_sorted_by_oddfreq[] (expect the for formatting and final -1) use:
#
#      cat job.dir/tally.1stodd |
#          sed -e '/^#/d' -e '/^0 /d' | fld 2 |
#          tr '\012' ',' | sed -e 's/,$//' -e 's/,/, /g' -e 's/$/,/'
#
# Without -p:
#
# The best_v1_verified_prime[] is sorted in reverse order by count.
# For best_v1_verified_prime[] (expect the for formatting and final -2) use:
#
#      cat job.dir/tally.1stint |
#          sed -e '/^#/d' -e '/^0 /d' | fld 2 |
#          tr '\012' ',' | sed -e 's/,$//' -e 's/,/, /g' -e 's/$/,/'

# parse args
#
export P_FLAG=
export USAGE="usage: $0 [-h] [-p] job.dir

    -h		print help and exit 0

    -p		print the best_v1_verified_prime[] array (def: print 4 common array)

    job.dir	job direcory under which tally files are used"
while getopts :hp flag; do
    case "$flag" in
    h)  echo "$USAGE" 1>&2
	exit 0
	;;
    p)	P_FLAG=true
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
JOB_DIR="$1"
if [[ $# -ne 1 ]]; then
    echo "$0: expected 1 arg" 1>&2
    echo "$USAGE" 1>&2
    exit 1
fi
export JOB_DIR="$1"

# firewall
#
if [[ ! -d $JOB_DIR ]]; then
   echo "$0: FATAL: job directory not found: $JOB_DIR" 1>&2
   exit 2
fi
export TALLY_1STINT="$JOB_DIR/tally.1stint"
if [[ ! -s $TALLY_1STINT ]]; then
    echo "$0: FATAL: missing non-empty tally.1stint file: $TALLY_1STINT" 1>&2
    exit 3
fi
export TALLY_1STODD="$JOB_DIR/tally.1stodd"
if [[ ! -s $TALLY_1STODD ]]; then
    echo "$0: FATAL: missing non-empty tally.1stodd file: $TALLY_1STODD" 1>&2
    exit 4
fi
export TALLY_1STINT="$JOB_DIR/tally.1stint"
if [[ ! -s $TALLY_1STINT ]]; then
    echo "$0: FATAL: missing non-empty tally.1stint file: $TALLY_1STINT" 1>&2
    exit 5
fi
export TALLY_1STODD="$JOB_DIR/tally.1stodd"
if [[ ! -s $TALLY_1STINT ]]; then
    echo "$0: FATAL: missing non-empty tally.1stodd file: $TALLY_1STINT" 1>&2
    exit 6
fi

# output arrays without -p
#
if [[ -z $P_FLAG ]]; then
    # output this command as a comment
    #
    echo "// $0 $JOB_DIR"
    echo

    # output best_v1_reverse_sorted_by_v1[] of no -p
    #
    cat <<EOF
/* Known 1st v(1) sorted by v(1) */
/*     NOTE: array values are from $TALLY_1STINT */
static const int64_t best_v1_reverse_sorted_by_v1[] = {
EOF
    (cat "$TALLY_1STINT" |
	sed -e '/^#/d' -e '/^0 /d' | fld 2 |
	sort -n |
	tr '\012' ',' | sed -e 's/,$//' -e 's/,/, /g' -e 's/$/,/' |
	fold -s -w 64
cat <<EOF2

-1	// must be the last value
EOF2
    ) | sed -e 's/^/    /' -e 's/  *$//'
    echo "};"
    echo

    # output best_v1_reverse_sorted_by_oddv1[] if no -p
    #
    cat <<EOF
/* Odd Known 1st v(1) sorted by v(1) */
/*     NOTE: array values are from $TALLY_1STODD */
static const int64_t best_v1_reverse_sorted_by_oddv1[] = {
EOF
    (cat "$TALLY_1STODD" |
	sed -e '/^#/d' -e '/^0 /d' | fld 2 |
	sort -n |
	tr '\012' ',' | sed -e 's/,$//' -e 's/,/, /g' -e 's/$/,/' |
	fold -s -w 64
    cat <<EOF2

-1	// must be the last value
EOF2
    ) | sed -e 's/^/    /' -e 's/  *$//'
    echo "};"
    echo

    # output best_v1_reverse_sorted_by_freq[] if no -p
    #
    cat <<EOF
/* Known 1st v(1) rev sorted by freq */
/*     NOTE: array values are from $TALLY_1STINT */
static const int64_t best_v1_reverse_sorted_by_freq[] = {
EOF
    (cat "$TALLY_1STINT" |
	sed -e '/^#/d' -e '/^0 /d' | fld 2 |
	tr '\012' ',' | sed -e 's/,$//' -e 's/,/, /g' -e 's/$/,/' |
	fold -s -w 64
    cat <<EOF2

-1	// must be the last value
EOF2
    ) | sed -e 's/^/    /' -e 's/  *$//'
    echo "};"
    echo

    # output best_v1_reverse_sorted_by_oddfreq[] if no -p
    #
    cat <<EOF
/* Odd Known 1st v(1) rev sorted by freq */
/*     NOTE: array values are from $TALLY_1STODD */
static const int64_t best_v1_reverse_sorted_by_oddfreq[] = {
EOF
    (cat "$TALLY_1STODD" |
	sed -e '/^#/d' -e '/^0 /d' | fld 2 |
	tr '\012' ',' | sed -e 's/,$//' -e 's/,/, /g' -e 's/$/,/' |
	fold -s -w 64
    cat <<EOF2

-1	// must be the last value
EOF2
    ) | sed -e 's/^/    /' -e 's/  *$//'
    echo "};"

# output arrays with -p
#
else
    # output this command as a comment
    #
    echo "// $0 -p $JOB_DIR"
    echo

    # output best_v1_verified_prime if -p
    #
    cat <<EOF
/* 1st v(1) from large verified primes > 999 and h=0mod3 rev sorted by freq */
/*     NOTE: array values are from $TALLY_1STINT */
const int64_t best_v1_verified_prime[] = {
EOF
    (cat "$TALLY_1STINT" |
	sed -e '/^#/d' -e '/^0 /d' | fld 2 |
	tr '\012' ',' | sed -e 's/,$//' -e 's/,/, /g' -e 's/$/,/' |
	fold -s -w 64
    cat <<EOF2

-1	// must be the last value
EOF2
    ) | sed -e 's/^/    /' -e 's/  *$//'
    echo "};"

    # output the largest_odd_v1_verified_prime static variable
    #
    LARGEST=$(cat "$TALLY_1STODD" |
		sed -e '/^#/d' -e '/^0 /d' | fld 2 | sort -n | tail -1)
    if [[ -z $LARGEST ]]; then
	echo "$0: FATAL: cannot determine largest non-zero " \
	     "count value from $TALLY_1STODD" 1>&2
	exit 6
    fi
    echo "// largest value found in best_v1_verified_prime[]"
    echo "const int64_t largest_odd_v1_verified_prime = $LARGEST;"
fi

# All Done!!! -- Jessica Noll, Age 2
#
exit 0
