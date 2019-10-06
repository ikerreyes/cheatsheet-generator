OUTPUT_DIR = ../templates/cheatsheets

SOURCE_DIR = raw
SOURCES := $(wildcard $(SOURCE_DIR)/*)
CHEATSHEETS := $(addprefix $(OUTPUT_DIR)/,$(notdir $(SOURCES:=.html)))


TEMPLATES_DIR = templates
TEMPLATES := $(wildcard $(TEMPLATES_DIR)/*)
SCRIPT := generate.py

# $(info $$CHEATSHEETS is [${CHEATSHEETS}])

all: $(CHEATSHEETS)

# only one source file is expected
$(OUTPUT_DIR)/%.html: $(SOURCE_DIR)/% $(TEMPLATES) $(SCRIPT)
	$(info generating $@)
	python generate.py $< $@

.PHONY: clean all

clean:
	rm -f $(CHEATSHEETS)
