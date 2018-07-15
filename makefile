all: repl.jar

repl.jar: manifest.txt classes
	jar cfmv repl.jar manifest.txt -C classes jscheme

classes: src/jscheme/*.java
	rm -rf classes
	mkdir classes
	javac src/jscheme/*.java -d classes

.PHONY: clean run test

clean:
	rm -rf classes repl.jar
	rm -rf tests/tmp*

run: repl.jar
	@java -jar repl.jar

tests: repl.jar tests/r4rs.scm
	make -C tests

