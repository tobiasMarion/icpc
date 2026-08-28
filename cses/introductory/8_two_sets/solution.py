def solve(n: int) -> None:
    total_sum = n * (n + 1) // 2

    if total_sum % 2 != 0:
        print("NO")
        return

    print("YES")

    set1: list[int] = []
    set2: list[int] = []

    if n % 4 == 0:
        for i in range(1, (n // 4) + 1):
            set1.extend([i, n - i + 1])

        for i in range((n // 4) + 1, (n // 2) + 1):
            set2.extend([i, n - i + 1])

    else:
        set1.extend([1, 2])
        set2.append(3)

        remaining_pairs: int = (n - 3) // 2

        for i in range(1, (remaining_pairs // 2) + 1):
            set1.extend([3 + i, n - i + 1])

        for i in range((remaining_pairs // 2) + 1, remaining_pairs + 1):
            set2.extend([3 + i, n - i + 1])

    print(len(set1))
    print(*set1)

    print(len(set2))
    print(*set2)


if __name__ == "__main__":
    n = int(input())
    solve(n)
