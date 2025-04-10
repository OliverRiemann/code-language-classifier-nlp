# -*- coding: utf-8 -*-

import sys

def small_inc(x, y, cells):
    cells[x][y] += 1
    if y > 0:
        cells[x][y-1] += 1
    if x > 0:
        cells[x-1][y] += 1
    if x < MAPSIZE-1:
        cells[x+1][y] += 1
    if y < MAPSIZE-1:
        cells[x][y+1] += 1

def medium_inc(x, y, cells):
    if y > 0:
        cells[x][y-1] += 1
        if x > 0:
            cells[x-1][y-1] += 1
        if x < MAPSIZE-1:
            cells[x+1][y-1] += 1
    cells[x][y] += 1
    if x > 0:
        cells[x-1][y] += 1
    if x < MAPSIZE-1:
        cells[x+1][y] += 1
    if y < MAPSIZE-1:
        cells[x][y+1] += 1
        if x > 0:
            cells[x-1][y+1] += 1
        if x < MAPSIZE-1:
            cells[x+1][y+1] += 1

def large_inc(x, y, cells):
    if y > 1:
        cells[x][y-2] += 1
    if y > 0:
        cells[x][y-1] += 1
        if x > 0:
            cells[x-1][y-1] += 1
        if x < MAPSIZE-1:
            cells[x+1][y-1] += 1
    cells[x][y] += 1
    if x > 1:
        cells[x-2][y] += 1
    if x > 0:
        cells[x-1][y] += 1
    if x < MAPSIZE-1:
        cells[x+1][y] += 1
    if x < MAPSIZE-2:
        cells[x+2][y] += 1
    if y < MAPSIZE-1:
        cells[x][y+1] += 1
        if x > 0:
            cells[x-1][y+1] += 1
        if x < MAPSIZE-1:
            cells[x+1][y+1] += 1
    if y < MAPSIZE-2:
        cells[x][y+2] += 1

SMALL = 1
MEDIUM = 2
LARGE = 3
MAPSIZE = 10

cells = [[0 for i in range(MAPSIZE)] for j in range(MAPSIZE)]
for line in sys.stdin:
    x , y, size = map(int, line.split(','))
    if size == SMALL:
        small_inc(x, y, cells)
    elif size == MEDIUM:
        medium_inc(x, y, cells)
    elif size == LARGE:
        large_inc(x, y, cells)
count = max_d = 0
for i in range(MAPSIZE):
    for j in range(MAPSIZE):
        if cells[i][j] == 0:
            count += 1
        else:
            max_d = max(max_d, cells[i][j])
print count
print max_d