module Function
    # Print Game Table
    # @param table array
    # @return array 
    def printTable table
        self.printDivider "top"
        puts "Table:"
        puts table.reverse().map { |x| x.join(' ') }
        puts "1 2 3 4 5 6 7"
        return table
    end

    # Print Welcome Screen
    def printWelcome
        self.printDivider "top"
        puts "Welcome to Connect Four!\n\n"
        puts "do you want to print the instructions? [y/N]"
    end

    # Generates Random Input
    # @return int 
    def generateRandomInput
        return rand(1..7).round()
    end

    # Print Winner
    # @param turn int
    # @param p1 string
    # @param p2 string
    def printWinner turn, p1, p2
        self.printDivider "top"

        if turn == 1
            puts "GAME OVER: "
            puts p2 + " WINS!"
        else 
            puts "CONGRATULATIONS: "
            puts p1 + " WINS!"
        end

        self.printDivider "bot"
    end

    # Print Text Divider
    # @param space string
    def printDivider space
        if space == "top"
            puts ""
        end

        puts "- - - - - - -"

        if space == "bot"
            puts ""
        end
    end

    # gets User Input
    # @return string
    def getInput
        gets.chomp
    end

    # Print User Guide
    def printGuide
        while true
            is_print_guide = self.getInput

            if is_print_guide == "y" or is_print_guide == "Y"
                self.printDivider "top"

                puts "Game Objective:"
                puts "  ■ = Represents as no Dots Placed yet!"
                puts "  X = Represents as your Dots!"
                puts "  O = Represents as your Enemy's Dots!\n\n"
                puts "  Both player will have chance to place 1 dot each round"
                puts "  You can place your Dots by typing [1 - 7]"
                puts "  self represents each columns in the game\n\n"
                puts "  Connect Four Dots and win the Game!\n\n"
                puts "Note:"
                puts "  You can connect them either"
                puts "  [Horizontal, Vertical or Diagonal]!\n\n"
                puts "  Simple enough? lets go! "

                self.printDivider "bot"
                return false
            elsif is_print_guide == "n" or is_print_guide == "N"
                return false
            end
        end
    end

    # Print whose turn is it
    # @param turn int
    def printTurn turn
        self.printDivider "top"
        puts "\n" + turn + "'s turn"
        puts "Choose column: [1 - 7]"
    end

    # Validates User Input [should be integer ranging from 1 to 7]
    # @param input string
    def validateInput input
        int = Integer(input || '')

        if int < 1 or int > 7
            nil
        else 
            int
        end

        rescue ArgumentError
        nil
    end

    # Prints Input Error
    def printInvalidInput
        self.printDivider "top"

        puts "Invalid User Input!"
        puts "Please try again!!"

        self.printDivider "bot"
    end

    # Check Pattern
    def checkPattern table, dot
        table_width = table[0].length()
        table_height = table.length()

        # Check Vertical Pattern
        for i in 0...table_height - 3 do # i is the row index
            for j in 0...table_width do # j is the column index
                if table[i][j] == dot and table[i + 1][j] == dot and table[i + 2][j] == dot and table[i + 3][j] == dot
                    return true
                end
            end
        end

        # Check Horizontal Pattern
        for i in 0...table_height - 3 do # i is the row index
            for j in 0...table_width do # j is the column index
                if table[i][j] == dot and table[i][j + 1] == dot and table[i][j + 2] == dot and table[i][j + 3] == dot
                    return true
                end
            end
        end
        
        # Check Diagonal up Patterns
        for i in 3...table_width do # i is the row index
            for j in 0...table_height - 3 do # j is the column index
                if table[j][i] == dot and table[j + 1][i - 1] == dot and table[j + 2][i - 2] == dot and table[j + 3][i - 3] == dot
                    return true
                end
            end
        end

        # Check Diagonal down Patterns
        for i in 3...table_width do # i is the row index
            for j in 3...table_height - 1 do # j is the column index
                if table[j][i] == dot and table[j - 1][i - 1] == dot and table[j - 2][i - 2] == dot and table[j - 3][i - 3] == dot
                    return true
                end
            end
        end

        return false
    end
end