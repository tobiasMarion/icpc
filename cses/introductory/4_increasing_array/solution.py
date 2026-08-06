input()

amount = 0
highest = 0

for value in map(int, input().split()):
    highest = max(highest, value)
    amount += highest - value

print(amount)