def generatePossibilities(string: str, index: int) -> list[str]:
  return [
    string[:index] + '0' + string[index + 1:],
    string[:index] + '1' + string[index + 1:]
  ]

def getPossibileBinary(string: str) -> list[int]:
  possibilities: list[str] = [ string ]

  for index, char in enumerate(string):
    if char == '1' or char == '0':
      continue

    demo: list[str] = []
    for possibility in possibilities:
      p1, p2 = generatePossibilities(possibility, index)
      demo.append(p1)
      demo.append(p2)

    possibilities = demo
  
  return list(map(lambda x: int(x, 2), possibilities))

def getPossibleMessage(possibleM: list[int], possibleN: list[int]) -> int:
  for m in possibleM:
    for n in possibleN:
      if m % n == 0: 
        return m
      
  return 0



m: str = input()
n: str = input()

possibleInputs: list[int] = getPossibileBinary(m)
possibleDivisors: list[int] = getPossibileBinary(n)

result: int = getPossibleMessage(possibleInputs, possibleDivisors)
binary: str = bin(result)[2:].zfill(len(m))
print(binary)
