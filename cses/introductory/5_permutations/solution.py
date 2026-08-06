n = int(input())

if n == 1:
    print(1)
elif n <= 3:
    print("NO SOLUTION")
else:
    ans: list[int] = []

    for i in range(2, n + 1, 2):
        ans.append(i)

    for i in range(1, n + 1, 2):
        ans.append(i)

    print(*ans)