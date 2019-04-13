# v1-data

The v1-data subdirectory:

https://github.com/arcetri/verified-prime

contains information about a survey of v(1) values used in primality proofs
for a large set of integers.
Details on this survey may be found in:

https://github.com/arcetri/verified-prime/v1-data/README.md

## Motivation

The v1-data subdirectory was created to support finding an optimal strategy for
testing if a large integers of the form __h*2<sup>n</sup>-1__ are prime.

We present a survey of v(1) values that may be used to test of
__h*2<sup>n</sup>-1__ is prime.

# Our two sets of large integers

We compiled two sets of 1000000 large integers of the form __h*2<sup>n</sup>-1__,
where __h*2<sup>n</sup>-1__ is not a multiple of 3, both having the following properties:

```
4331116 <= n <= 4332115
12996351 <= h <= 13002350
h is odd
```

We wanted __n__ to be non-trivial in size, so we selected a random 23-bit
number, 4331116 as a lower bound for our __n__.
We excluded __h < 3n__ in order increase the of number of values in these sets that are prime.

In the first set of 1000000 integers:

```
h is a multiple of 3
```

The second set of 1000000 integers:

```
h is a not multiple of 3
```

# Description of the surveys

XXX - to be completed - XXX

# Summary of important findings

XXX - to be completed - XXX
