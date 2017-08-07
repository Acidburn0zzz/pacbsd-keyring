V=20170806

PREFIX = /usr

install:
	install -dm755 $(DESTDIR)$(PREFIX)/share/pacman/keyrings
	install -m0644 pacbsd.gpg $(DESTDIR)$(PREFIX)/share/pacman/keyrings/
	install -m0644 pacbsd-trusted $(DESTDIR)$(PREFIX)/share/pacman/keyrings/


uninstall:
	rm -f $(DESTDIR)$(PREFIX)/share/pacman/keyrings/pacbsd{.gpg,-trusted}
	rmdir -p --ignore-fail-on-non-empty $(DESTDIR)$(PREFIX)/share/pacman/keyrings/

dist:
	mkdir pacbsd-keyring-$(V)
	cp -rv Makefile pacbsd-trusted pacbsd.gpg master master-keyids packager packager-keyids update-keys pacbsd-keyring-$(V)
	tar -cvzf pacbsd-keyring-$(V).tar.gz pacbsd-keyring-$(V)/
	gpg --detach-sign --use-agent pacbsd-keyring-$(V).tar.gz

.PHONY: install uninstall dist
