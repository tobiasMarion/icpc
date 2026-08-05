[amount_of_fruits, amount_of_classes] = map(int, input().split())

minStudentsPerClass = [0] * amount_of_classes

for i in range(amount_of_fruits):
  votesPerClass = list(map(int, input().split()))

  for j in range(amount_of_classes):
    minStudentsPerClass[j] = max(minStudentsPerClass[j], votesPerClass[j])

print(sum(minStudentsPerClass))