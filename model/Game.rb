require_relative "../model/Config.rb" 
require_relative "../model/Function.rb" 

class Game
    include Config # Game Config
    include Function # Game Function

    @game_ends = false
    @turn = nil
    @winner = nil
    @table = Array[]

    # Initializes the Game
    def start
        printWelcome
        printGuide
        @table = self.TABLE
        printTable @table
        setFirstTurn

        # Main Game Loop
        while not @game_ends
            if @turn == 1 # if player's turn
                playerPlaceDot
                @turn = 0
                printTable @table
                @game_ends = checkPattern @table, self.PLAYER_DOT
            else 
                enemyPlaceDot
                @turn = 1
                printTable @table
                @game_ends = checkPattern @table, self.ENEMY_DOT
            end
        end

        printWinner @turn
    end

    # Randomly Decide who will play the first turn
    def setFirstTurn
        @turn = rand().round()
    end

    # Get User Input and Place Dot 
    def playerPlaceDot
        printTurn @turn
        input = getInput

        if validateInput input
            placeDot (validateInput input), self.PLAYER_DOT
        else
            printInvalidInput
            playerPlaceDot
        end
    end

    # Get Random Column and Place Dot
    def enemyPlaceDot
        printTurn @turn
        input = validateInput generateRandomInput    
        placeDot input, self.ENEMY_DOT
    end

    # Validate dot placement, if column is full promts to place again,
    # if there is space below, use recursion to drop the dot
    # @param column_index int 
    # @param2 dot string
    # @param3 row int
    # return 
    def placeDot column_index, dot, row = 5
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
            
            placeDot column_index, dot, row - 1
        end
    end
end