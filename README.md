proquintize
===========

Transform output containing long hex strings into [Proquints](https://arxiv.org/html/0901.4016) for easy vocal transmission.

Example:

	$ git rev-parse master | perl proquintize.pl
	rinik-fohab-firol-sosor-sapag-sakor-zojom-vijam-bobol-kisiv

If the hex strings are not multiple of 2 bytes, the remainder will be appended:

	$ echo affe23b | perl proquintize.pl
	puzuv-23b

You can also specify the minimum length hex stings must have to be substituted:

	$ sha1sum deadcafe | perl proquintize.pl -l 10
	kudin-lulad-pinoh-giban-dujup-vusig-sabon-hokim-sihak-jabit  deadcafe

License
-------

WTFPL.
