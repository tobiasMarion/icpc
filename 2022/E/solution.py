n = int(input()) 

heights = list(map(int, input().split()))

arrowsOnHeights = {}
shots = 0

for h in heights:
    if arrowsOnHeights.get(h, 0) > 0:
        arrowsOnHeights[h] -= 1
        arrowsOnHeights[h-1] = arrowsOnHeights.get(h-1, 0) + 1
    else:
        shots += 1
        arrowsOnHeights[h-1] = arrowsOnHeights.get(h-1, 0) + 1

print(shots)