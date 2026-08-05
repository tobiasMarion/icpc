amountOfShips = int(input())

sea = [[0] * 11 for _ in range(11)]

isPlacementValid = 'Y'

for _ in range(amountOfShips):
  [direction, length, row, column] = list(map(int, input().split()))

  dx = (direction + 1) % 2
  dy = direction

  for part in range(length):
    x = column + dx * part
    y = row + dy * part

    if x <= 10 and y <= 10 and sea[y][x] == 0 :
      sea[y][x] = 1

    else:
      isPlacementValid = 'N'
      break 

print(isPlacementValid)