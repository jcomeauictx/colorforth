all: /boot/cm2001 /boot/jc2007 advise
/boot/cm2001: color.com
	sudo dd if=/dev/zero of=$@ bs=1024 count=1440
	sudo dd if=$< of=$@ conv=notrunc
/boot/jc2007: jc2007/color.com
	sudo dd if=/dev/zero of=$@ bs=1024 count=1440
	sudo dd if=$< of=$@ conv=notrunc
jc2007/color.com:
	cd $(<F) && $(MAKE) newcode
advise:
	@echo Make sure the contents of lilo.conf are configured in bootloader >&2
