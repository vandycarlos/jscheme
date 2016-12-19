all: repl.jar

repl.jar: manifest.txt classes
	jar cfmv repl.jar manifest.txt -C classes jscheme

classes: src/jscheme/*.java
	rm -rf classes
	mkdir classes
	javac src/jscheme/*.java -d classes

.PHONY: clean run

clean:
	rm -rf classes repl.jar

run: repl.jar
	@java -jar repl.jar
