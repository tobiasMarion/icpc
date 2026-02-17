def generatePossibilities(string, index):
  return [
    string[:index] + '0' + string[index + 1:],
    string[:index] + '1' + string[index + 1:]
  ]



def getPossibileBinary(string):
  possibilities = [ string ]

  for index, char in enumerate(string):
    if char == '1' or char == '0':
      continue

    demo = []
    for possibility in possibilities:
      p1, p2 = generatePossibilities(possibility, index)
      demo.append(p1)
      demo.append(p2)

    possibilities = demo
  
  return list(map(lambda x: int(x, 2), possibilities))



def getPossibleMessage(possibleM, possibleN):
  for m in possibleM:
    for n in possibleN:
      if m % n == 0:
        return m
      
  return 0

m = input()
n = input()

possibleInputs = getPossibileBinary(m)
possibleDivisors = getPossibileBinary(n)

result = getPossibleMessage(possibleInputs, possibleDivisors)
binary = bin(result)[2:].zfill(len(m))
print(binary)
