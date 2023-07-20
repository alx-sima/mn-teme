# Copyright 2023 Sima Alexandru (312CA)
SRC=$(wildcard **/*.m)
README=README

ARCHIVE=312CA_SimaAlexandru_Tema1

.PHONY: pack check clean

pack: $(ARCHIVE).zip

$(ARCHIVE).zip: $(SRC) $(README)
	zip -FSr $@ $^

check:
	python3 checker.py

clean:
	rm -f $(ARCHIVE).zip
