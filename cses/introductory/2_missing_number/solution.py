n = int(input())
numbers_sum = sum(map(int, input().split()))

expected_sum = n * (n + 1) // 2
print(expected_sum - numbers_sum)