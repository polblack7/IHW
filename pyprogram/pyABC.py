print("Enter N: ")
n = int(input())

if n < 1 or n > 10:
    print("Incorrect n")
    quit()

a = []

for i in range(n):
    a.append(int(input()))


f_p = -1
l_n = -1
for i in range(n):
    if a[i] > 0 and f_p == -1:
        f_p = i
    if a[i] < 0:
        l_n = i

b = []

for i in range(n):
    if i != f_p and i != l_n:
        b.append(a[i])

print(b)
