#!/bin/bash
echo -e "---Testing example file 1:---\n" >> resultats.txt
./a.out ExampleFiles/example.txt > resultats.txt
echo -e "\n---Testing example file 2:---\n" >> resultats.txt
./a.out ExampleFiles/example2.txt >> resultats.txt
echo -e "\n---Testing example file 3:---\n" >> resultats.txt
./a.out ExampleFiles/example3.txt >> resultats.txt
echo -e "\n---Testing example file 4:---\n" >> resultats.txt
./a.out ExampleFiles/example4.txt >> resultats.txt
echo -e "\n---Testing example file 5:---\n" >> resultats.txt
./a.out ExampleFiles/example5.txt >> resultats.txt
echo -e "\n---Testing example file 6:---\n" >> resultats.txt
./a.out ExampleFiles/example6.txt >> resultats.txt
echo -e "\n---Testing example file 7:---\n" >> resultats.txt
./a.out ExampleFiles/example7.txt >> resultats.txt
