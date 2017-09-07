# verified-prime

The file, "h-n.verified-prime.txt", contains a list of verified primes of
the form __h*2<sup>n</sup>-1__ where __h__ < __2<sup>n</sup>__ and that
have been proven to be prime by at least three of more independent tests.

An independent test means that proof of primality was performed on using
a different code base and run on a different machone than any of the
other tests.

Not only did we perform at least two different tests on these primes,
others contributed their tests and helped further verify the primality
of the values found in this list.

As if this release, "h-n.verified-prime.txt" contains 233787 verified primes.

## Motivation

The main motivation for this list is to provide those developing code to search for new
prime numbers with a large list of known prime numbers.

When we were testing GoPrime (see the https://github.com/arcetri/GoPrime
site), we collected lists of primes of the form  __h*2<sup>n</sup>-1__
and tested our code against those lists.
To our surprize we discovered some of these prime lists contained multiple
values that were not prime.
In some cases the list contained values where primes as small as 3 were
a factor of the number!

## Usage

The file, "h-n.verified-prime.txt" contains a list of primes of the form __h*2<sup>n</sup>-1__,
one per line.
Each line contains a __h__ value, followed by s space, followed by an __n__ value followed by a newline.
The values are written in base 10 (decimal).

We only considered __h*2<sup>n</sup>-1__ primes where __h__ < __2<sup>n</sup>__.
For example, __289*2<sup>3</sup>-1__ is not found on the list,
even though 2311 is prime because 289 >=  __2<sup>3</sup>__.

Most primality tests for numbers of the form __h*2<sup>n</sup>-1__
require __h__ < __2<sup>n</sup>__ and so we placed the same restriction on
this list.

### Exmaple

The line:

```
1111 11
```

indicates that __1111*2<sup>11</sup>-1__ is prime.
__1111*2<sup>11</sup>-1__ == 2275327 is a prime number.

### Important NOTE

This list is not intended to be exhaustive.
There are many primes of the form  __h*2<sup>n</sup>-1__ that are __NOT__ found in the list.
There are many primes of the form  __h*2<sup>n</sup>-1__ that we skipped.

## Contribute

If you discover that one of the values in our list is not prime, let us know
by __giving us a factor of the number in question__
or __by proving the number in question is not prime using a rigorous mathematical proof__.

### Please do not

We are not very interested in expanding this list.
Adding more primes to our list will not significantly improve the usefulness of these test cases.

__Please do not__ send us primes to add to the list.
The effort to add additional primes and to verify that they are prime is not worth the effort.
If you send us new primes to add to the list, __we will silently ignore your message__.

__Please do not__ ask us to verify primes that you may have found.
We do not have the time, nor the resources to verify your prime.
If you ask us to verify your prime, __we will silently ignore your message__.

__Please do not__ tell is about your theory of how to find prime numbers.
We do not have the time, nor the resources to look into new methods of finding primes.
If you send us your theory on how to find a prime, __we will silently ignore your message__.

## License

This project is distributed under the terms of the Apache License Version 2.0, January 2004.
See file "LICENSE" for further reference.

If you do use this list, we would apprecaite if you would tell us and/or mention in papers that you used our list.
