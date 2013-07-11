class StatusOfTheGame < ActiveRecord::Base

	serialize :array, Array
	attr_accessible :array, :current_player

end
