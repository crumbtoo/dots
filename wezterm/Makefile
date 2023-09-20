SRC := $(wildcard *.fnl)

all: wezterm.lua

wezterm.lua: $(SRC)
	fennel --require-as-include -c wezterm.fnl > $@

.PHONY:
clean:
	@rm wezterm.lua

