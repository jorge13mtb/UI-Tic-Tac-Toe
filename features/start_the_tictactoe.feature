Feature: start the tictactoe game

	Scenario: The game has not started yet 
		Given the game has not started yet
		When I go to the game page
		Then I should see the empty game board
