n = int(input())

coeffs = input().split()
poly = 0
for i in range(len(coeffs)):
    if coeffs[i] == '1':
        potencia = n - i
        poly |= (1 << potencia)

iterations = 0

while poly != 1:
    if poly & 1:
        poly = (poly << 1) ^ poly ^ 1
    else:
        poly >>= 1
    
    iterations += 1

print(iterations)