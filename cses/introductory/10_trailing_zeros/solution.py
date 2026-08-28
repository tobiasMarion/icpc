n = int(input())

amount = 0
while n >= 5:
    n //= 5
    amount += n

print(amount)
