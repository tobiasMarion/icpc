n = int(input())

for k in range(1, n + 1):
    total = k * k * (k * k - 1) // 2
    attacks = 4 * (k - 1) * (k - 2)

    print(total - attacks)