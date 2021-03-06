
WIN_COMBINATIONS = [
  [0,1,2],
  [3,4,5],
  [6,7,8],
  [0,3,6],
  [1,4,7],
  [2,5,8],
  [0,4,8],
  [2,4,6]
]
def display_board(board)
  puts " #{board[0]} | #{board[1]} | #{board[2]} "
  puts "-----------"
  puts " #{board[3]} | #{board[4]} | #{board[5]} "
  puts "-----------"
  puts " #{board[6]} | #{board[7]} | #{board[8]} "
end
def input_to_index(user_input)
  user_input.to_i - 1
end
def move(board, index, token)
  board[index] = token
end
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " " || board[index] == "" )
end

def valid_move?(board, index)
  index.between?(0,8) && !position_taken?(board, index)
end

def turn(board)
  puts "Please enter 1-9:"
  input = gets.strip
  index = input_to_index(input)

  if valid_move?(board, index)
    move(board, index, current_player(board))
    display_board(board)
  else
    turn(board)
  end
end
def turn_count(board)
  counter = 0
  board.each do |space|
      if space  == "X" || space  == "O"
         counter += 1
      end
    end
      board = counter
end
def current_player(board)
  if turn_count(board) % 2 == 0
     "X"
  else
     "O"
  end
end
def won?(board)
  WIN_COMBINATIONS.detect do |win_combo|
    board[win_combo[0]] == board[win_combo[1]] && board[win_combo[1]] == board[win_combo[2]] && position_taken?(board, win_combo[0])
  end
end
def full?(board)
board.all? do |position|
  position == "X" || position == "O"
 end
end

def draw?(board)
  if !won?(board) && full?(board)
    true
  else
    (won?(board) && full?(board)) || won?(board)
    false
  end
end
def over?(board)
  if won?(board) || draw?(board) || full?(board)
    true
  end
end

def winner(board)
  if won?(board)
    board[won?(board)[0]]
  end
end
def play(board)
  while !over?(board)
  turn(board)
end
if winner(board) == "X"
  puts "Congratulations X!"
elsif winner(board) == "O"
  puts "Congratulations O!"
else draw?(board)
  puts "Cat's Game!"
end
end
