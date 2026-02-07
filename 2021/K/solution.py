[minMinutesToBeRested, totalMinutes, amountOfMeals] = list(map(int, input().split()))

willBeRested = 'N'
previousCheckpoint = 0

for meal in range(amountOfMeals):
  time = int(input())

  if time - previousCheckpoint >= minMinutesToBeRested:
    willBeRested = 'Y'

  previousCheckpoint = time

if totalMinutes - previousCheckpoint >= minMinutesToBeRested:
  willBeRested = 'Y'

print(willBeRested)
