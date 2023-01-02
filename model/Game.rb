require_relative "../model/Config.rb" 
require_relative "../model/Function.rb" 
require_relative "../model/Player.rb" 
require_relative "../model/Computer.rb" 

class Game
    include Config # Game Config
    include Function # Game Function

    @is_game_ends = false # Is Game Already Ended
    @turn = nil # Current Playing Side Index
    @table = Array[] # The Game Table
    @player1 = nil
    @player2 = nil

    # Initializes the Game
    def start
        printWelcome
        printGuide
        @table = self.TABLE
        printTable @table
        @player1 = Player.new "Player"
        @player2 = Computer.new "Computer" # Just Change the computer to Player to make 2 player
        setFirstTurn

        # Main Game Loop
        while not @is_game_ends
            if @turn == 1 # if player's turn
                printTurn @player1.name
                playerPlaceDot
                @turn = 0
                @is_game_ends = checkPattern(@table, self.PLAYER_DOT)
            else 
                printTurn @player2.name
                enemyPlaceDot
                input = @player2.getDotIndex
                @turn = 1
                @is_game_ends = checkPattern(@table, self.ENEMY_DOT)
            end

            printTable @table
        end

        printWinner @turn, @player1.name, @player2.name
    end

    # Randomly Decide who will play the first turn
    def setFirstTurn
        @turn = rand().round()
    end
    
    # Get User Input and Place Dot 
    def playerPlaceDot
        input = getInput

        if validateInput input
            dropDot (validateInput input), self.PLAYER_DOT
        else
            printInvalidInput
            playerPlaceDot
        end
    end

    # Get Random Column and Place Dot
    def enemyPlaceDot
        input = validateInput generateRandomInput    
        dropDot input, self.ENEMY_DOT
    end

    # Validate dot placement, if column is full promts to place again,
    # if there is space below, use recursion to drop the dot
    # @param2 column_index int 
    # @param3 dot string
    # @param4 row int
    # return Array 
    def dropDot column_index, dot, row = 5
        # If column is full, prompts again
        if @table[row][column_index - 1] != self.EMPTY_DOT and row == 5
            printInvalidInput
            
            if @turn == 1 # if player's turn prompt again
                playerPlaceDot
            else 
                enemyPlaceDot
            end
        
        # if last element place the dot
        elsif @table[row - 1][column_index - 1] != self.EMPTY_DOT and @table[row][column_index - 1] == self.EMPTY_DOT and row == 5
            @table[row][column_index - 1] = dot

        # If there is space below, call again and drop the dot
        elsif @table[row - 1][column_index - 1] == self.EMPTY_DOT
            if row - 1 == -1
                return
            end

            # drop the dot
            @table[row - 1][column_index - 1] = dot

            # pop the above dot
            if not row == 5
                @table[row][column_index - 1] = self.EMPTY_DOT
            end
            
            dropDot column_index, dot, row - 1
        end
    end
end