
def fib(n):
  n0 = 1
  n1 = 1
  for _ in range(n):
    n0, n1 = n1, n0 + n1

  return n0

n = int(input())

print(fib(n))