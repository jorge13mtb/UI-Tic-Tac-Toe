
require 'spec_helper'

describe "Game Pages" do
  
	describe "Home Page" do
		it "should have the title 'Home' and the content 'Tic Tac Toe'" do
      visit root_path
      page.should have_title('Home')
      page.should have_content('Tic Tac Toe')
    end
  end

	describe "Help Page" do
		it "should have the title 'Help' and the content 'Tic Tac Toe Help'" do
      visit help_path
      page.should have_title('Help')
      page.should have_content('Tic Tac Toe Help')
    end
  end


	describe "Start the game" do
  	it "with empty game board" do  
    	visit root_path
			page.should have_button("-")
			page.should have_button("-")
		end
	end
end

