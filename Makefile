OUTPUT_DIR = build

SOURCE_DIR = raw
SOURCES := $(wildcard $(SOURCE_DIR)/*)
CHEATSHEETS := $(addprefix $(OUTPUT_DIR)/,$(notdir $(SOURCES:=.html)))


TEMPLATES_DIR = templates
TEMPLATES := $(wildcard $(TEMPLATES_DIR)/*)
STYLESHEET = style/cheatsheet.sass
CSS = style/cheatsheet.css
SCRIPT := generate.py

# $(info $$CHEATSHEETS is [${CHEATSHEETS}])

all: $(CHEATSHEETS)

$(OUTPUT_DIR):
	mkdir -p $@

$(CSS): $(STYLESHEET)
	$(info generating $@)
	sass $< $@

# only one source file is expected
$(OUTPUT_DIR)/%.html: $(SOURCE_DIR)/% $(TEMPLATES) $(SCRIPT) $(CSS) | $(OUTPUT_DIR)
	$(info generating $@)
	python generate.py $< $@


.PHONY: clean all

clean:
	rm -f $(CHEATSHEETS)
