SRC_DIRS := 'src'
ALL_VFILES = $(shell find $(SRC_DIRS) \
							-name "*.v" \
						)
PROJ_VFILES := $(shell find 'src' -name "*.v")

# extract any global arguments for Rocq from _RocqProject
ROCQPROJECT_ARGS := $(shell sed -E -e '/^\#/d' -e "s/'([^']*)'/\1/g" -e 's/-arg //g' _RocqProject)

# user configurable
Q:=@
ROCQ_ARGS :=
ROCQC := rocq compile

default: vo

vo: $(PROJ_VFILES:.v=.vo)
vos: $(PROJ_VFILES:.v=.vos)
vok: $(PROJ_VFILES:.v=.vok)

.rocqdeps.d: $(ALL_VFILES) _RocqProject
	@echo "ROCQ dep $@"
	$(Q)rocq dep -vos -f _RocqProject $(ALL_VFILES) > $@

# do not try to build dependencies if cleaning
ifeq ($(filter clean,$(MAKECMDGOALS)),)
-include .rocqdeps.d
endif

%.vo: %.v _RocqProject | .rocqdeps.d
	@echo "ROCQ compile $<"
	$(Q)$(ROCQC) $(ROCQPROJECT_ARGS) $(ROCQ_ARGS) -o $@ $<

%.vos: %.v _RocqProject | .rocqdeps.d
	@echo "ROCQ -vos $<"
	$(Q)$(ROCQC) $(ROCQPROJECT_ARGS) -vos $(ROCQ_ARGS) $< -o $@

%.vok: %.v _RocqProject | .rocqdeps.d
	@echo "ROCQ -vok $<"
	$(Q)$(ROCQC) $(ROCQPROJECT_ARGS) -vok $(ROCQ_ARGS) $< -o $@

clean:
	@echo "CLEAN vo glob aux"
	$(Q)find $(SRC_DIRS) \( -name "*.vo" -o -name "*.vo[sk]" \
		-o -name ".*.aux" -o -name ".*.cache" -o -name "*.glob" \) -delete
	rm -f .rocqdeps.d

.PHONY: default
.DELETE_ON_ERROR:
