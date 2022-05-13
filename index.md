# Dependencies
- dpkg
- dpkg-deb
- dpkg-shlibdeps
# Install
```sh
sudo apt-get install ./.deb
```
# unsinstall
```sh
sudo apt-get purge makedeb
```
# Using
## help
```bash
makedeb --help
```
or
```bash
makedeb help
```
## generate .deb with main.bin
when use script
```bash
./makedeb binairy_file
```
if installed
```bash
makedeb binairy_file
```

## generate deb_directory
```bash
makedeb -d binairy_file
```
Binairy_file is bin application.<br>
## generate .deb with deb_directory
```bash
makedeb -dex dir_deb
```

# in use
After it ask some parameters like this
```
	Package: (def:binairy_file)

	Version: (def:1.0)

  Architecture: (def:amd64)

	Maintainer: example -> <name@mail.com>

	Description:
```
it make dir Package-Version-Architecture.<br>
And .deb with same name.

