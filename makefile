PROJECT	= app

OBJDIR  = obj

ZENPATH = ~/zen-macos-x86_64-0.8.20200713LTS/
GCCPATH = ~/gcc-arm-none-eabi-8-2018-q4-major/bin
OBJCOPY = $(GCCPATH)/arm-none-eabi-objcopy
SIZE    = size



all: $(OBJDIR)/$(PROJECT)

$(OBJDIR)/$(PROJECT): _start.zen
	$(ZENPATH)zen build-exe -target thumb-freestanding-eabi -mcpu cortex-m0 --strip --release-small --linker-script linker.ld --emit asm  $< --name $@
	${OBJCOPY} -S $@ -g -O binary $@.bin
	$(SIZE) -A $@

clean:
	rm -f -r $(OBJDIR) | exit 0

-include $(shell mkdir $(OBJDIR) 2>/dev/null)
