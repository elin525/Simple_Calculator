# One-Digit Integer Calculator (Assembly, NASM)

## 📘 Description

This project implements a **one-digit integer calculator** using **x86-64 Assembly (NASM)** on a **Linux system**. The program reads a fixed-format arithmetic expression from user input, evaluates the result from **left to right (no operator precedence)**, and prints the full expression and result to the terminal.

Supported operators:
- Addition (`+`)
- Subtraction (`-`)
- Multiplication (`*`)
- Division (`/`)

---

## Features

- Accepts a 9-character expression: `a␕b␕c␕d␕e`, where:
  - `a, b, c, d, e` are single-digit integers (0–9)
  - `␕` are arithmetic operators (+, -, *, /)
- Executes operations strictly from **left to right**
- Displays the input expression and result
- Converts integer result to string manually (custom `toString` function)

---

## How to Run?
- sudo apt update
- sudo apt install nasm
- nasm -f elf64 simple_calculator.asm -o simple_calculator.o
- ld simple_calculator.o -o simple_calculator
- ./simple_calculator

