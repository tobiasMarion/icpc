n = int(input())
corners = []

for i in range(n):
    line = input().split()

    if i == 0 or i == n - 1:
        a, b = int(line[0]), int(line[-1])
        if i == n - 1:
            a, b = b, a
        corners.extend([a, b])

print(corners.index(min(corners)))
