proquintize
===========

Transform output containing long hex strings into [Proquints](https://arxiv.org/html/0901.4016) for easy vocal transmission.

Example:

	$ git log -1 HEAD | perl proquintize.pl
	commit rinik-fohab-firol-sosor-sapag-sakor-zojom-vijam-bobol-kisiv
	Author: Florian Larysch <fl@n621.de>
	Date:   Mon Jul 4 21:04:49 2016 +0200
	
	    import it
	

If the hex strings are not multiple of 2 bytes, the remainder will be appended:

	$ echo affe23b | perl proquintize.pl
	puzuv-23b

You can also specify the minimum length hex stings must have to be substituted:

	$ sha1sum deadcafe | perl proquintize.pl -l 10
	kudin-lulad-pinoh-giban-dujup-vusig-sabon-hokim-sihak-jabit  deadcafe

License
-------

WTFPL.
