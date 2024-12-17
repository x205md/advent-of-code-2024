#ifndef BOARD_H
#define BOARD_H

#include <stdio.h>
#include <stdlib.h>
#include <stdbool.h>

enum Direction { UP, RIGHT, BOTTOM, LEFT };

typedef struct
{
    uint8_t *board;
    size_t length;
    size_t x;
    size_t y;
    enum Direction direction;
} Board;

Board *Board_new(FILE *file);
void Board_free(Board *board);
void Board_print(Board *board);
bool Board_next(Board *board);
size_t Board_distinct_positions(Board *board);

#endif