# portage-stable

This fork was created during the d75 merge to address [1]. Basically,
we need to modify an eclass to avoid setting `BDEPEND`, which is not
yet supported properly by some CrOS tools. Hopefully upstream will
resolve this some time soon, then we can drop this fork. And for some
reason I also had to change one ebuild from EAPI 6 to 7.

## 32-bit GnuPG

In d76 GnuPG started being required as a board package. As far as I
can tell it was never buildable in 32-bit anyway. We needed a few
workarounds in the ebuild to get it to build properly -- these should
probably be reverted in d77. This work is documented in OVER-9976[2]

[1] https://neverware.atlassian.net/browse/OVER-9470
[2] https://neverware.atlassian.net/browse/OVER-9976
