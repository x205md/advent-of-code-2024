#include "board.h"

size_t get_line_length(char *line)
{
    size_t i = 0;
    while (line != NULL && line[i] != '\n' && line[i] != '\0')
    {
        i += 1;
    }

    return i;
}

Board *Board_new(FILE *file)
{
    Board *board = malloc(sizeof(Board));

    char *line = NULL;
    size_t ln = 0;
    size_t cn = 0;
    ssize_t gl;

    while ((gl = getline(&line, &ln, file)) != -1)
    {
        if (board->length == 0)
        {
            board->length = get_line_length(line);
            board->board = malloc(sizeof(uint8_t) * board->length * board->length);
        }

        for (size_t i = 0; i < board->length; i++)
        {
            board->board[cn * board->length + i] = line[i];
            if (line[i] == '^')
            {
                board->x = i;
                board->y = cn;
                board->direction = UP;
            }
        }

        cn += 1;
    }

    return board;
}

void Board_free(Board *board)
{
    free(board->board);
    free(board);
}

void Board_print(Board *board)
{
    for (size_t i = 0; i < board->length; i++)
    {
        for (size_t j = 0; j < board->length; j++)
        {
            printf("%c", board->board[i * board->length + j]);
        }
        printf("\n");
    }
}

bool Board_next(Board *board)
{
    if (board->direction == UP)
    {
        size_t next_position = (board->y - 1) * board->length + board->x;

        if (board->board[next_position] == '#')
        {
            board->direction = RIGHT;
        }
        else
        {
            board->board[board->y * board->length + board->x] = 'X';
            board->y = board->y - 1;
        }
    }
    else if (board->direction == BOTTOM)
    {
        size_t next_position = (board->y + 1) * board->length + board->x;

        if (board->board[next_position] == '#')
        {
            board->direction = LEFT;
        }
        else
        {
            board->board[board->y * board->length + board->x] = 'X';
            board->y = board->y + 1;
        }
    }
    else if (board->direction == RIGHT)
    {
        size_t next_position = board->y * board->length + (board->x + 1);

        if (board->board[next_position] == '#')
        {
            board->direction = BOTTOM;
        }
        else
        {
            board->board[board->y * board->length + board->x] = 'X';
            board->x = board->x + 1;
        }
    }
    else if (board->direction == LEFT)
    {
        size_t next_position = board->y * board->length + (board->x - 1);

        if (board->board[next_position] == '#')
        {
            board->direction = UP;
        }
        else
        {
            board->board[board->y * board->length + board->x] = 'X';
            board->x = board->x - 1;
        }
    }

    if ((board->x < 0 || board->x >= board->length) || (board->y < 0 || board->y >= board->length))
    {
        return false;
    }
    return true;
}

size_t Board_distinct_positions(Board *board)
{
    size_t sum = 0;
    for (size_t i = 0; i < (board->length * board->length); i++)
    {
        if (board->board[i] == 'X') {
            sum += 1;
        }
    }

    return sum;
}
