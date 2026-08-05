amountOfDirectors = int(input())
maxDuration = int(input())

intervals = amountOfDirectors - 1
maxPerDirector = int((maxDuration - intervals) / amountOfDirectors)

print(maxPerDirector)