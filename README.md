# Random Number Shuffle Scripts (1–10)

![Bash](https://img.shields.io/badge/language-Bash-blue)
![GitHub](https://img.shields.io/badge/status-Complete-brightgreen)

Generate a random permutation of integers from 1 to 10 using three different approaches, with a test script to verify correctness.

---

## Table of Contents

1. [Project Description](#project-description)  
2. [Build / Setup Instructions](#build--setup-instructions)  
3. [Usage](#usage)  
4. [Implementations](#implementations)  
   - [Pure Bash ($RANDOM)](#pure-bash-random)  
   - [GNU `shuf` / `gshuf`](#gnu-shuf--gshuf)  
   - [Cryptographically Secure (`openssl rand`)](#cryptographically-secure-openssl-rand)  
5. [Test Script](#test-script)  
6. [Comparison of Approaches](#comparison-of-approaches)  
7. [Known Limitations / Bugs](#known-limitations--bugs)  
8. [Future Improvements](#future-improvements)  
9. [Summary](#summary)  

---

## Project Description

This project provides multiple Bash-based implementations for generating a **random permutation of integers from 1 to 10**, ensuring:

- Each number appears **exactly once**  
- The order is **randomized each time**  

Three implementations are included:

1. **Pure Bash ($RANDOM)** – fully self-contained, implements **Fisher–Yates shuffle**  
2. **GNU `shuf` / `gshuf`** – relies on GNU coreutils, does not explicitly implement Fisher–Yates  
3. **Cryptographically secure (`openssl rand`)** – secure randomness, suitable for sensitive applications  

A **test script** is included to verify correctness.

---

## Build / Setup Instructions

No compilation required. Make all scripts executable:

```bash
chmod +x *.sh
