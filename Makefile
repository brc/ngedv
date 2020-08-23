UPSTREAM ?= /git/qmk/qmk_firmware
KEYMAP ?= ngedv
GIT ?= git

.PHONY: all
all: fetch symlink

.PHONY: symlink
symlink:
	cd ./qmk_firmware/keyboards && \
    for kbd in *; do \
        ln -sfvn $(PWD)/qmk_firmware/keyboards/$$kbd/keymaps/$(KEYMAP) \
            $(UPSTREAM)/keyboards/$$kbd/keymaps/$(KEYMAP); \
    done


.PHONY: fetch
fetch:
	cd $(UPSTREAM) && $(GIT) checkout master && $(GIT) pull


.PHONY: clean
clean:
	find $(UPSTREAM) -type l -name $(KEYMAP) |xargs -r rm -vf
