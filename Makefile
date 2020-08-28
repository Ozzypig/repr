OUT_FILE = repr.rbxmx
IN_FILE = repr.lua

ROJO = rojo
ROJO_PROJECT = default.project.json

.PHONY = clean

$(OUT_FILE) : $(IN_FILE)
	$(ROJO) build $(ROJO_PROJECT) --output $(OUT_FILE)

clean :
	$(RM) $(OUT_FILE)
