module Config
    def COLUMNS() 7 end # Table Columns

    def ROWS() 6 end # Table Rows

    def ENEMY_DOT() "O" end # Enemy Dot

    def PLAYER_DOT() "X" end # Player Dot 

    def EMPTY_DOT() "■" end # Empty Dot 

    def TABLE # Table Array
        Array.new(self.ROWS) {Array.new(self.COLUMNS, '■')}
    end
end