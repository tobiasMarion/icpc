dna = input()

current = 0
prev = ''
biggest = 0

for letter in dna:
    current = current + 1 if letter == prev else 1
    biggest = max(current, biggest)
    prev = letter

print(biggest)
