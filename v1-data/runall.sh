#!/bin/sh

export OUTDIR=/var/tmp/v1-data
mkdir -p "$OUTDIR"
export SRCDIR=/usr/global/src/cisco/verified-prime/v1-data

for test in byusecount_129max-v1-search-0mod3 oddlinear_165max-v1-search-0mod3 \
	    oddlinear_165max-v1-search-not0mod3 linear_165max-v1-search-0mod3 \
	    linear_165max-v1-search-not0mod3 smallestoddv1_byusecount_165max-v1-search-0mod3 \
	    smallestoddv1_sorted_165max-v1-search-0mod3 smallestv1_byusecount_129max-v1-search-0mod3 \
	    sorted_4max-v1-search-not0mod3; do
    rm -f "$OUTDIR/$test.out"
    chmod +x "$SRCDIR/$test.sh"
    echo "nohup time $SRCDIR/$test.sh > $OUTDIR/$test.out 2>&1 < /dev/null &"
    nohup time "$SRCDIR/$test.sh" > "$OUTDIR/$test.out" 2>&1 < /dev/null &
done
