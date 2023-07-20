# Copyright (C) 2023 Alexandru Sima (312CA) #

SRC = $(wildcard functions/*.m)
ZIP = 312CA_SimaAlexandru_Tema2.zip
README = Readme.pdf

pack: $(ZIP)

$(ZIP): $(SRC) $(README)
	zip -FSr $@ $^ Digit\ Recognition\ -\ {in,ref} in ref checker.m mnist.mat

$(README):
	$(MAKE) -C doc

clean:
	rm -f $(ZIP)
	rm -f $(README)
	$(MAKE) -C doc clean