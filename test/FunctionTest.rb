require_relative "../model/function"
require_relative "../model/config"
require "test/unit"
 
class FunctionTest < Test::Unit::TestCase
    include Function # Game Function
    include Config # Game Config

	# Get Base Table
	def getTable
		Array.new(6) { Array.new(7, '■') }
	end	  

	# Check Horizontal Pattern
    def test_check_horizontal_pattern
		table = getTable
		player_dot = "X"
		table[0][0] = player_dot
		table[0][1] = player_dot
		table[0][2] = player_dot
		table[0][3] = player_dot
		message = "Should return true if successfully match horizontal pattern"
      	
		assert(checkPattern(table, player_dot), message)
    end

	# Check Vertical Pattern
    def test_check_vertical_pattern
		table = getTable
		player_dot = "X"
		table[0][0] = player_dot
		table[1][0] = player_dot
		table[2][0] = player_dot
		table[3][0] = player_dot
		message = "Should return true if successfully match vertical pattern"
      	
		assert(checkPattern(table, player_dot), message)
    end

	# Check Diagonal Up Pattern
    def test_check_diagonal_up_pattern
		table = getTable
		player_dot = "X"
		table[0][0] = player_dot
		table[1][1] = player_dot
		table[2][2] = player_dot
		table[3][3] = player_dot
		message = "Should return true if successfully match diagonal up pattern"
      	
		assert(checkPattern(table, player_dot), message)
    end

	# Check Diagonal Down Pattern
    def test_check_diagonal_down_pattern
		table = getTable
		player_dot = "X"
		table[0][3] = player_dot
		table[1][2] = player_dot
		table[2][1] = player_dot
		table[3][0] = player_dot
		message = "Should return true if successfully match diagonal down pattern"
      	
		assert(checkPattern(table, player_dot), message)
    end

end