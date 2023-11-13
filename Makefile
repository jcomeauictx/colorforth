SUBDIRS := $(wildcard [a-z]*)
CVSROOT := :ext:jcomeau_ictx@colorforth.cvs.sourceforge.net/cvsroot/colorforth
CVS_RSH := ssh
ARCHIVE := /usr/src/howerd
export
set:
	set
clean:
	$(foreach subdir, $(SUBDIRS), \
	 $(shell [ -d $(subdir) ] && cd $(subdir) && make clean))
upload:
#	$(MAKE) clean
	rsync -Crvuz . jcomeau_ictx@colorforth.sourceforge.net:/home/groups/c/co/colorforth/htdocs/
commit:
	cvs commit
bootfiles:
	find $(ARCHIVE) -iname boot.asm