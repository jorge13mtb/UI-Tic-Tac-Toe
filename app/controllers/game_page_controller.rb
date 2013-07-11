class GamePageController < ApplicationController
	require 'tic_tac_toe'

	before_filter :load_status
  
	def home
  end


	def put_piece
	  get_patameters_of_the_view
		add_the_new_piece_in_the_game
	  update_the_board_in_the_model
	  redirect_to_home
	end


  def help
  end


	def new_game  
     @tictactoe_game.clean_the_board
	   update_the_board_in_the_model
	   redirect_to_home
	end

private

	def load_status
  	@tictactoe_game = Tictactoe.new
		create_the_status_of_the_game_in_the_data_base(@tictactoe_game.board) if not is_there_status_of_the_game_in_the_data_base
    @status_of_the_game = StatusOfTheGame.first     
    @tictactoe_game.board = @status_of_the_game.array	
	end


  def is_there_status_of_the_game_in_the_data_base
  	StatusOfTheGame.count > 0	
	end


	def create_the_status_of_the_game_in_the_data_base(game_board)
		new_status = StatusOfTheGame.new
		new_status.update_attributes({ :array => game_board, :current_player => "X"})
	end

	
	def add_the_new_piece_in_the_game
    if @status_of_the_game.current_player == "Y" and @tictactoe_game.put_piece_at_game(@row, @column,"Y") 
		  @status_of_the_game.update_attributes({ :current_player => "X"})
		elsif @status_of_the_game.current_player == "X" and @tictactoe_game.put_piece_at_game(@row, @column,"X") 
		  @status_of_the_game.update_attributes({ :current_player => "Y"})
	  end    
	end


	def redirect_to_home
		respond_to do |format|
			format.html{redirect_to(game_page_home_path)}
		end 
	end


	def update_the_board_in_the_model
		 @status_of_the_game.update_attributes({ :array => @tictactoe_game.board})
	end


	def get_patameters_of_the_view
		@row = params[:row].to_i
		@column = params[:column].to_i
	end
end
