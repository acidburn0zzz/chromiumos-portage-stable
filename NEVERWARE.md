# portage-stable

This fork was created during the d75 merge to address [1]. Basically,
we need to modify an eclass to avoid setting `BDEPEND`, which is not
yet supported properly by some CrOS tools. Hopefully upstream will
resolve this some time soon, then we can drop this fork. And for some
reason I also had to change one ebuild from EAPI 6 to 7.

[1] https://neverware.atlassian.net/browse/OVER-9470
