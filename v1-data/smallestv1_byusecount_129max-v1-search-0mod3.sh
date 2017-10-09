#!/bin/bash

/usr/global/bin/calc -d -p \
   '/* survey */
    x_tbl_len = 39;
    mat x_tbl[x_tbl_len];
    x_tbl = {
    	3, 5, 9, 11, 15, 17, 21, 29, 20, 27, 35, 36, 39, 41, 45, 32, 51, 44, 49, 56, 59,
	57, 65, 55, 69, 71, 66, 95, 81, 77, 72, 99, 80, 74, 84, 67, 87, 104, 129
    };
    beyond_v1 = 130;
    cache_size = beyond_v1+2;
    mat cached_v1[cache_size];
    for (n=4331116; n < 4331116+1000; ++n) {
	for (h=12996351; h < 12996351+6000; h += 2) {

	    /* skip if h*2^n-1 is a multiple of 3 */
	    if (((h%3 == 1) && (n%2 == 0)) || ((h%3 == 2) && (n%2 == 1))) {
		continue;
	    }

	    /* compute v(1) stats when h is a odd multiple of 3 */
	    if (h % 3 == 0 && isodd(h)) {

		/* setup for test */
		testval = h*2^n-1;

		/* clear cache */
		matfill(cached_v1, 0);
		cached_jacobi = 0;

		/* print valid v(1) for this testval */
		for (i = 0, count=0, first_v1 = 0, jacobi_count = 0; i < x_tbl_len; ++i) {

		    /* pick up next v(1) */
		    v1 = x_tbl[i];

		    /* Check v(1) for condition 1 part 1 */
		    v1m2 = v1-2;
		    cacheable = (v1m2 >= 0 && v1m2 < cache_size) ? 1 : 0;
		    ++jacobi_count;	/* note jacobi op */
		    if (cacheable == 1 && cached_v1[v1m2] == 0) {
			/* if we were caching jacobi values, this would be a new value */
			++cached_jacobi;
			cached_v1[v1m2] = jacobi(v1m2, testval);
		    }
		    if ((cacheable == 1 && cached_v1[v1m2] != 1) || jacobi(v1m2, testval) != 1) {
			/* v(1) is not valid for testval */
		        continue;
		    }

		    /* Check v(1) for condition 1 part 2 */
		    v1p2 = v1+2;
		    cacheable = (v1p2 >= 0 && v1p2 < cache_size) ? 1 : 0;
		    ++jacobi_count;	/* note jacobi op */
		    if (cacheable == 1 && cached_v1[v1p2] == 0) {
			/* if we were caching jacobi values, this would be a new value */
			++cached_jacobi;
			cached_v1[v1p2] = jacobi(v1p2, testval);
		    }
		    if ((cacheable == 1 && cached_v1[v1p2] != -1) || jacobi(v1p2, testval) != -1) {
			/* v(1) is not valid for testval */
		        continue;
		    }

		    /* v(1) is valid to test primality of testval */
		    ++count;
		    if (first_v1 == 0) {
			first_v1 = v1;
			print "# h:", h, "n:", n, "jacobi_count:", jacobi_count, "cached_jacobi:", cached_jacobi, "first_v1:", first_v1;
		    }
		    print h, n, jacobi_count, cached_jacobi, v1;
		}
		if (first_v1 == 0) {
		    print "#NOTICE: h:", h, "n:", n, "total_jacobi_count:", jacobi_count, "total_cached_jacobi:", cached_jacobi, "had no v1 <", beyond_v1;
		}

		/* count of the number of v(1) values found */
		print "# h:", h, "n:", n, "total_jacobi_count:", jacobi_count, "total_cached_jacobi:", cached_jacobi, "v1_count:", count;
	    }
	}
    }'

