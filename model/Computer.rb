require_relative "../model/Player.rb" 

class Computer < Player
    include Function # Game Function
    include Config # Game Config
    attr_reader :name
    @name = "computer"

    def initialize name
        super(name)
    end

    # Get Bot's Input and Place Dot 
    # @return int
    def getDotIndex
        input = validateInput generateRandomInput
        puts input
        return input
    end
end