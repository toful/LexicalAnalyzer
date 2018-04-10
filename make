#!/bin/bash
flex FALexicalAnalyzer.l
cc lex.yy.c -lfl
