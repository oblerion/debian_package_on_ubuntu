# makedeb

## using
```bash
./makedeb.sh binairy_file
```
Binairy_file is bin application.<br>
After it ask some parameters like this
```
	Package: (package name)

	Version: (def:1.0)

  Architecture: (def:amd64)

	Maintainer: example -> name <name@mail.com>

	Descrition:
```
it make dir Package-Version-Architecture.<br>
And .deb with same name.
