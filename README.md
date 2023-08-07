# Pawn Movement Simulator

This is an small rails application that simulates the movement of the pawn. I have generated an rails API only application with out active records.
Since i wanted the command line to persist the state of the object after execution, I chose to use the singleton pattern for the pawn calss. I did this by including the Singleton module .
I have also utilized the ActiveModel::Validations for validating inputs to my calss. I have designed a initator class that reads the commands and does some baisc validation.
To see how the program works you can Looks at the rspec or run the program from Rails console.

To run this application in you local 
- Pull the branch
- bundle install
- start rails terminal with command: rails c
- Use the Initiator.run_command to pass the commands to the program . Example
   Initiator.run_command('PLACE 0,0,NORTH,WHITE')
- User Initiator.run_command('REPORT') to view the current position
- Please refer to the problem statement below for a full list of funtionality

  
# Problem Statement

Description:

 - The application is a simulation of a Pawn moving on a chess board, of dimensions 8 squares x 8 squares.
 - There are no other obstructions/pieces on the chess board.
 - The pawn is free to roam around the surface of the table following the rules below,but must be prevented from falling off. Any movement
   that would result in the pawn falling from the table must be prevented, however further valid movement commands must still be allowed.
 - The pawn can move only to adjacent squares but not diagonally. The first time that the pawn moves it can move 1 or 2 squares.
 - Create an application that can read in commands of the following form:
   1)PLACE X,Y,F,C
   2)MOVE X
   3)LEFT
   4)RIGHT
   5)REPORT
- PLACE will put the pawn on the board in position X, Y, facing NORTH, SOUTH, EAST or WEST and Colour(White or Black)
- The origin (0,0) can be considered to be the SOUTH WEST most corner.
- The first valid command to the pawn is a PLACE command, after that, any sequence of commands may be issued, in any order, including another PLACE command. The
  application should discard all commands in the sequence until a valid PLACE command has been executed.
- MOVE will move the pawn one unit forward in the direction it is currently facing.
- LEFT and RIGHT will rotate the pawn 90 degrees in the specified direction without changing the position of the pawn.
- REPORT will announce the X,Y,F and C of the pawn. This can be in any form, but standard output is sufficient.
- If the pawn is not on the board it needs to ignore the MOVE, LEFT, RIGHT and REPORT commands.
- Input can be from a file, from standard input or through a UI with four buttons and scrolling log of the result, as the developer chooses. (This might depend on the dev
  stack you use)
