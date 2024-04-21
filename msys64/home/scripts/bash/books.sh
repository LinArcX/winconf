#!/bin/bash

commands=("/mnt/D/books/01_computer/programming/rust/TheRustProgrammingLanguage2ndEdition.pdf"
  "/mnt/D/books/01_computer/programming/c/compiler_design/CraftingInterpreters.pdf"
  "/mnt/D/books/01_computer/programming/c/C_Programming.pdf"
  "/mnt/D/books/01_computer/programming/c/gnu-c-manual.pdf"
  "/mnt/D/books/01_computer/programming/c/+Brian W Kernighan, Dennis M Ritchie - The Ansi C Programming Language-Prentice Hall.pdf"
  "/mnt/D/books/01_computer/programming/c/The Standard C Library.pdf"
  "/mnt/D/books/01_computer/programming/c/The Standard C Library.pdf"
  "/mnt/D/books/01_computer/programming/c/Advanced C 1992.pdf"
	"/mnt/D/books/01_computer/programming/c/wisdom/C_Programming_Just_the_Faqs.pdf"
	"/mnt/D/books/01_computer/programming/c/compiler_design/_Compiler_Design_In_C.pdf"
	"/mnt/D/books/01_computer/programming/c/language_features/C_The_Function_Pointer_Tutorials.pdf"
  "/mnt/D/books/01_computer/software_engineering/paradigms/oo/Object_Thinking_David_West.pdf"
	"/mnt/D/books/01_computer/programming/c++/windows/Windows_System_Programming.pdf"
	"/mnt/D/books/01_computer/programming/c/+Test_Driven_Development_for_Embedded_C.pdf"
	"/mnt/D/books/01_computer/programming/c++/c++_standard_n3690.pdf"
	"/mnt/D/books/01_computer/programming/c++/C++_FAQs.pdf"
	"/mnt/D/books/01_computer/programming/c++/wisdom/C++_Interview_Questions.pdf"
	"/mnt/D/books/01_computer/programming/c++/03/+API_Design_for_C++-Martin_ready.pdf"
	"/mnt/D/books/01_computer/programming/c++/security/Cryptography_in_C_and_C++.pdf"
	"/mnt/D/books/01_computer/programming/c++/wisdom/+C++_coding_standards_101_rules_guidelines_and_best_practices.pdf"
	"/mnt/D/books/01_computer/programming/c++/other/Functional_Programming_in_C++.pdf"
	"/mnt/D/books/01_computer/programming/c++/system_programming/C++_System_Programming_Cookbook.pdf"
	"/mnt/D/books/01_computer/programming/c++/wisdom/optimization/+Optimized_C++_Proven_Techniques_for_Heightened_Performance.pdf"
	"/mnt/D/books/01_computer/programming/c++/tdd/Modern_C++_Programming_with_Test-Driven_Development_Code_Better_Sleep_Better.pdf"
	)
selected=$(printf '%s\n' "${commands[@]}" | sed "s|~|$HOME|" | fzf --header="books:" --preview 'v {}')
zathura $selected &