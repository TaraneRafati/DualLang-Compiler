# DualLang Compiler Implementation 

This repository contains the full implementation of the compiler for **DualLang**, a domain-specific language developed for the Compiler Design course at K. N. Toosi University of Technology (KNTU).

DualLang is designed to facilitate communication and computation between two distinct devices.

## Features 

* **Dual Device Structure:** Programs are structured around `DEVICE1` and `DEVICE2` blocks.
* **Interactions:** Supports `SEND` (from Device 1) and `RECIEVE` (by Device 2) statements for inter-device communication.
* **Calculations:** Allows algebraic and logical expressions using operators like `+`, `-`, `*`, `/`, `^`, `&&`, `||`, `!`, and various comparison operators.
* **Control Flow:** Includes `if-then-else` conditional statements and `while` loops.
* **Functions:** Supports defining and calling functions with typed parameters.

## Project Phases

This project was developed according to the KNTU course requirements:

1.  **Phase 1 (Lexical Analysis):** Design and implementation of the Lexer using ANTLR.
2.  **Phase 2 (Syntax Analysis):** Design and implementation of the Parser using ANTLR, based on the provided grammar rules.


---
*This project was developed for the Compiler Design for Computer Science course at KNTU (2024).*
