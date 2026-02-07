hasFailed = False

values = input().split()

for value in values:
  if value == '9':
    hasFailed = True

if (hasFailed):
  print('F')
else:
  print('S')