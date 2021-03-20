# Helper Method
#require "pry"

def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# Define your WIN_COMBINATIONS constant

WIN_COMBINATIONS = [
  [0, 1, 2], #top row #combo 1
  [3, 4, 5], #middle row #combo 2
  [6, 7, 8], #bottom row #combo 3
  [0, 3, 6], #left column #combo 4
  [1, 4, 7], #middle column #combo 5
  [2, 5, 8], #right column #combo 6 
  [0, 4, 8], #diagonal left #combo 7 
  [2, 4, 6] #diagonal right #combo 8
  ]
  
  def won?(board)
    winner = nil 
    WIN_COMBINATIONS.find do |individual_combo|
      if board[individual_combo[0]] == board[individual_combo[1]] && board[individual_combo[1]] == board[individual_combo[2]] && position_taken?(board, individual_combo[0])
      individual_combo
        end 
      end
  end

def full?(board)
  board.all? do |spot|
    spot == "X" || spot == "O"
  end 
end 

def draw?(board)
  full?(board) && !won?(board)
end 

def over?(board)
  won?(board) || draw?(board) || full?(board)
end 

def winner(board)
  maybe_winning_array = won?(board)
  if maybe_winning_array == nil 
    nil 
  else 
    spot_in_array = maybe_winning_array[0]
    board[spot_in_array]
  end 
end 

