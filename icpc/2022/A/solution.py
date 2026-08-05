input()

text = input()

total = 0
a = 0

for letter in text:
  if letter == 'a':
    a += 1
  else:
    if (a > 1):
      total += a
    
    a = 0

if (a > 1):
  total += a

print(total)