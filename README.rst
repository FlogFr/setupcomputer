Dependencies for building the package
=====================================

- buildessential
- devscripts
- debhelper
- dh-make
- lintian


Building the package
====================

- `dpkg-buildpackage -b -us -uc`


Install the package
===================

- `sudo dpkg -i ../setupcomputer_$(dpkg-parsechangelog --show-field Version)_amd64.deb`
