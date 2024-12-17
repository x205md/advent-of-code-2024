#include <stdio.h>
#include <stdlib.h>
#include "board.h"

int main(void)
{
    const char *filename = "input.txt";
    FILE *file = fopen(filename, "r");
    if (file == NULL)
    {
        exit(EXIT_FAILURE);
    }

    Board *board = Board_new(file);
    fclose(file);

    while(Board_next(board)) {}

    //Board_print(board);
    printf("Distinct positions: %d\n", Board_distinct_positions(board));
    Board_free(board);
    
    return EXIT_SUCCESS;
}
