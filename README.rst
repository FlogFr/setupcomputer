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

- `sudo dpkg -i ../setupcomputer_*.deb`
