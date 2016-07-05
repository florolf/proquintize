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

Separators can be stripped out:

	$ ip link show dev eth0 | perl proquintize.pl -s :
	3: eth0: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1500 qdisc fq_codel state UP mode DEFAULT group default qlen 1000
	    link/ether hobaz-suvod-mazim brd zuzuz-zuzuz-zuzuz

or

	$ gpg --fingerprint 39abcff8 | perl proquintize.pl -s ' ' -l 10
	pub   rsa4096 2011-10-11 [SC] [expires: 2017-06-21]
	      lukak-zosuf-tovop-mufaj-popuh-pikup-kijib-tomag-gokor-suzum
	      uid           [ unknown] Florian Larysch <fl@n621.de>
	      uid           [ unknown] Florian Larysch <florolf@devbraindump.de>
	      sub   rsa4096 2011-10-11 [E] [expires: 2017-06-21]
	      sub   rsa4096 2011-10-11 [S] [expires: 2017-06-21]

License
-------

WTFPL.
