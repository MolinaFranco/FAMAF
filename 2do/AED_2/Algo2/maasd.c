#include <stdio.h>
#define BOARD_SIZE 3


char get_winner(char board[BOARD_SIZE][BOARD_SIZE]) {

  char result = '-';
  for (int i=0;i < BOARD_SIZE;i++) {
    if (board[i][1] == board[i][2] == board[i][0] !='-'){
      // result = board[i][1];
      result = board[i][1];
    }
  }
  
  for (int h=0;h < BOARD_SIZE;h++) {
    if ( board[1][h] == board[2][h] == board[0][h]!='-'){
      result = board[1][h];
      }
    }

  if ( board[1][1] == board[2][2] == board[0][0] !='-'){
    result = board[1][1];
  }
  if ( board[1][3] == board[2][2] == board[3][1] !='-'){
    result = board[1][3];
  }

  return result;
  
}





int main(void) {
  
  char board[BOARD_SIZE][BOARD_SIZE] = {
    { 'x', 'x', 'x' },
    { '-', '-', '-' },
    { '-', '-', '-' }
  };  

  printf("%c \n", get_winner(board));
  return 0;
}