BIN=mkpasswd
FILES=$(BIN)

.PHONY: all
all:	$(BIN)
	@true

.PHONY: testall
testall: flake8 pylint mypy test

.PHONY: flake8
flake8:
	@flake8 --ignore=E501 $(FILES)

.PHONY: pylint
pylint:
	@pylint --disable=line-too-long $(FILES)

.PHONY: mypy
mypy:
	@mypy $(FILES)

.PHONY: test
test:
	@bash test.sh

.PHONY: install
install:
	install -m 0755 $(BIN) /usr/local/bin/ 2>/dev/null || install -m 0755 $(BIN) $(HOME)/bin/

.PHONY: uninstall
uninstall:
	rm -f /usr/local/bin/$(BIN) 2>/dev/null || rm -f $(HOME)/bin/$(BIN)
