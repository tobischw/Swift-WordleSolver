# Swift-WordleSolver
Solve and analyze Wordle games. Command-line tool written in Swift

## Example

```
Answer: HUMID
===========================

-- "MICRO"
🟨🟨⬜️⬜️⬜️
  → 🟨 Contains "M" somewhere
  → 🟨 Contains "I" somewhere
  → 🟨 "M" will never appear on #1.
  → 🟨 "I" will never appear on #2.
  → ⬜️ Does NOT contain "R" anywhere
  → ⬜️ Does NOT contain "O" anywhere
  → ⬜️ Does NOT contain "C" anywhere

-- "SMILE"
⬜️🟨🟨⬜️⬜️
  → 🟨 Contains "M" somewhere
  → 🟨 Contains "I" somewhere
  → 🟨 "M" will never appear on #2.
  → 🟨 "M" will never appear on #1.
  → 🟨 "I" will never appear on #3.
  → 🟨 "I" will never appear on #2.
  → ⬜️ Does NOT contain "S" anywhere
  → ⬜️ Does NOT contain "R" anywhere
  → ⬜️ Does NOT contain "O" anywhere
  → ⬜️ Does NOT contain "L" anywhere
  → ⬜️ Does NOT contain "E" anywhere
  → ⬜️ Does NOT contain "C" anywhere

-- "ADMIT"
⬜️🟨🟩🟩⬜️
  → 🟩 Matched "M" on #3.
  → 🟩 Matched "I" on #4.
  → 🟨 Contains "M" somewhere
  → 🟨 Contains "I" somewhere
  → 🟨 Contains "D" somewhere
  → 🟨 "M" will never appear on #2.
  → 🟨 "M" will never appear on #1.
  → 🟨 "I" will never appear on #3.
  → 🟨 "I" will never appear on #2.
  → 🟨 "D" will never appear on #2.
  → ⬜️ Does NOT contain "T" anywhere
  → ⬜️ Does NOT contain "S" anywhere
  → ⬜️ Does NOT contain "R" anywhere
  → ⬜️ Does NOT contain "O" anywhere
  → ⬜️ Does NOT contain "L" anywhere
  → ⬜️ Does NOT contain "E" anywhere
  → ⬜️ Does NOT contain "C" anywhere
  → ⬜️ Does NOT contain "A" anywhere

-- "HUMID"
🟩🟩🟩🟩🟩
  → 🟩 Matched "U" on #2.
  → 🟩 Matched "M" on #3.
  → 🟩 Matched "I" on #4.
  → 🟩 Matched "H" on #1.
  → 🟩 Matched "D" on #5.
  → 🟨 Contains "M" somewhere
  → 🟨 Contains "I" somewhere
  → 🟨 Contains "D" somewhere
  → 🟨 "M" will never appear on #2.
  → 🟨 "M" will never appear on #1.
  → 🟨 "I" will never appear on #3.
  → 🟨 "I" will never appear on #2.
  → 🟨 "D" will never appear on #2.
  → ⬜️ Does NOT contain "T" anywhere
  → ⬜️ Does NOT contain "S" anywhere
  → ⬜️ Does NOT contain "R" anywhere
  → ⬜️ Does NOT contain "O" anywhere
  → ⬜️ Does NOT contain "L" anywhere
  → ⬜️ Does NOT contain "E" anywhere
  → ⬜️ Does NOT contain "C" anywhere
  → ⬜️ Does NOT contain "A" anywhere


Attempts: 4
Rules: 21 
```

## How to Use
You will need to find a list of n-letter words, in a plain .txt file.
Capitalization does not matter. I use [this one](https://github.com/charlesreid1/five-letter-words/blob/master/sgb-words.txt). 
