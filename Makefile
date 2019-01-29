# Shared
include ../environ.mk

src = src/minfs_common.c src/minfs_win.c
obj = $(src:.c=.o)
dep = $(obj:.o=.d)  # one dependency file for each source

.PHONY: clean all

minfs.a: $(obj)
	@echo Linking $@
	@$(LDLIB) /OUT:$@ $(LDLIBFLAGS) $^

all: minfs.a

clean:
	@$(RM) $(subst /,$(PSEP),src/*.o)
	@$(RM) $(subst /,$(PSEP),src/*.d)
	@$(RM) *.a

.c.o:
	@echo $<
	@$(CC) -c $(CFLAGS) $(DEFINES) $< -o $@

-include $(dep)   # include all dep files in the makefile

# rule to generate a dep file by using the C preprocessor
# (see man cpp for details on the -MM and -MT options)
%.d: %.c
	@$(CC) $(CFLAGS) $(DEFINES) $< -MM -MT $(@:.d=.o) >$@

