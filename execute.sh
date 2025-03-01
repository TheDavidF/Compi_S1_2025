#!/bin/bash
echo "STARTING JFLEX COMPILATION"
java -jar jflex-full-1.9.1.jar LexerMarkdown.jflex

echo "STARTING CUP COMPILATION"
java -jar java-cup-11b.jar -parser Parser -symbols sym ParserMark.cup