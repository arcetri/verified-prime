#!/bin/bash
#
# gen.non-baseline.sh - generate non-baseline job directories

# Copyright (C) 2019  Landon Curt Noll
#
# Calc is open software; you can redistribute it and/or modify it under
# the terms of the version 2.1 of the GNU Lesser General Public License
# as published by the Free Software Foundation.
#
# Calc is distributed in the hope that it will be useful, but WITHOUT
# ANY WARRANTY; without even the implied warranty of MERCHANTABILITY
# or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU Lesser General
# Public License for more details.
#
# A copy of version 2.1 of the GNU Lesser General Public License is
# distributed with calc under the filename COPYING-LGPL.  You should have
# received a copy with calc; if not, write to Free Software Foundation, Inc.
# 51 Franklin Street, Fifth Floor, Boston, MA  02110-1301, USA.
#
# chongo <was here> /\oo/\     http://www.isthe.com/chongo/
# Share and enjoy!  :-)        http://www.isthe.com/chongo/tech/comp/calc/

# run gen.job.sh for our set of n values
#
./gen.job.sh 1391827
./gen.job.sh 3727058
./gen.job.sh 5718259
./gen.job.sh 12776050
./gen.job.sh 23059373
./gen.job.sh 56126460
./gen.job.sh 132174368
./gen.prime-small.sh
./gen.prime-large.sh
./gen.prime-all.sh
