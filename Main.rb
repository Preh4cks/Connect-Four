require_relative "./model/Game.rb" 

class Main < Game
	# Initializes the Game
	def initialize
		self.start
	end
end

main = Main.new