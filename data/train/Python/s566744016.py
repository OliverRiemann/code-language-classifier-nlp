import sys


def small(grid, x, y):
    grid[x][y] += 1
    grid[x + 1][y] += 1
    grid[x][y + 1] += 1
    grid[x][y - 1] += 1
    grid[x - 1][y] += 1
    return grid


def middle(grid, x, y):
    grid[x][y] += 1
    grid[x + 1][y] += 1
    grid[x][y + 1] += 1
    grid[x][y - 1] += 1
    grid[x - 1][y] += 1
    grid[x - 1][y - 1] += 1
    grid[x - 1][y + 1] += 1
    grid[x + 1][y + 1] += 1
    grid[x + 1][y - 1] += 1
    return grid


def large(grid, x, y):
    grid[x][y] += 1
    grid[x + 1][y] += 1
    grid[x][y + 1] += 1
    grid[x][y - 1] += 1
    grid[x - 1][y] += 1
    grid[x - 1][y - 1] += 1
    grid[x - 1][y + 1] += 1
    grid[x + 1][y + 1] += 1
    grid[x + 1][y - 1] += 1
    grid[x][y + 2] += 1
    grid[x][y - 2] += 1
    grid[x + 2][y] += 1
    grid[x - 2][y] += 1
    return grid


grid = [[0 for _ in range(14)] for __ in range(14)]
for line in sys.stdin:
    d = list(map(int, line.split(",")))
    x = d[0] + 2
    y = d[1] + 2
    ink_size = d[2]
    if ink_size == 1:
        grid = small(grid, x, y)
    elif ink_size == 2:
        grid = middle(grid, x, y)
    else:
        grid = large(grid, x, y)
max_element = 0
count = 0
for i in range(2, 12):
    for j in range(2, 12):
        max_element = max(max_element, grid[i][j])
        if grid[i][j] == 0:
            count += 1
print(count)
print(max_element)

