require_relative "../model/Config.rb" 
require_relative "../model/Function.rb" 

class Player
    include Function # Game Function
    include Config # Game Config
    attr_reader :name
    @name = "player"

    def initialize name
        @name = name
    end
end