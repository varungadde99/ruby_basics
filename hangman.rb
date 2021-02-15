#Code Structure
#Modules
	# - ShowHangman
	# - Hangman
	# - Instruction

#Class
	# - Player

#--------------------------------------------

#Scoring Module - included in Hangman Module
module ShowHangman
	def show_hangman(life,answerString,correctWord)
	    puts "Remaining Lives: " + life.to_s

	    case life
	    when 6
	      puts ""
	      puts "      __________"
	      puts "      |        |"
	      puts "               |"
	      puts "               |"
	      puts "               |"
	      puts "               |"
	      puts "               |"
	      puts "               |"
	      puts "    ============"
	    when 5
	      puts ""
	      puts "      __________"
	      puts "      |        |"
	      puts "      0        |"
	      puts "               |"
	      puts "               |"
	      puts "               |"
	      puts "               |"
	      puts "               |"
	      puts "    ============"
	    when 4
	      puts ""
	      puts "      __________"
	      puts "      |        |"
	      puts "      0        |"
	      puts "      |        |"
	      puts "      |        |"
	      puts "               |"
	      puts "               |"
	      puts "               |"
	      puts "    ============"
	    when 3
	      puts ""
	      puts "      __________"
	      puts "      |        |"
	      puts "      0        |"
	      puts "      |/       |"
	      puts "      |        |"
	      puts "               |"
	      puts "               |"
	      puts "               |"
	      puts "    ============"
	    when 2
	      puts ""
	      puts "      __________"
	      puts "      |        |"
	      puts "      0        |"
	      puts "     \\|/       |"
	      puts "      |        |"
	      puts "               |"
	      puts "               |"
	      puts "               |"
	      puts "    ============"
	    when 1
	      puts ""
	      puts "      __________"
	      puts "      |        |"
	      puts "      0        |"
	      puts "     \\|/       |"
	      puts "      |        |"
	      puts "     /         |"
	      puts "               |"
	      puts "               |"
	      puts "    ============"
	    when 0
	      puts ""
	      puts "      __________"
	      puts "      |        |"
	      puts "      0        |"
	      puts "     \\|/       |"
	      puts "      |        |"
	      puts "     / \\       |"
	      puts "               |"
	      puts "               |"
	      puts "    ============"
	    
	      # final celebration for losing
	      puts "\n\n"
	      puts "Correct Word was : " + correctWord
	      puts "OOPS! R.I.P Amigo!"
	      puts "Better Luck next time, " + @username
	    end
  	end
end

#Module for Entire Hangman Game
module Hangman

	include ShowHangman

	def show_question
		
		#Collection of Words
		words_list = ["ruby","monkey","amazing","pancake","josh","intern"]
		already_guessed = []
		
		#random selection of correct word
		correctWord = words_list[rand(6)]
		
		#declaration of answerString
		answerString = ""
		
		#-----------------------------------
		# Debbuging logic to check each character of answerString
		#puts "\nBelow Chars"
		#answerString.each_char { |c| 
    		#puts c
		#}		
		#-----------------------------------

		# AnswerString blanks printing logic
		lengthOfCorrectWord = correctWord.length
		var = 1
		while(lengthOfCorrectWord > 0)
			if(var ==1)
				print "Question Word : "
				var =0;
			end
			answerString = answerString + "_" + " "
			lengthOfCorrectWord = lengthOfCorrectWord - 1 
		end
		
		print answerString

	
		countOfCorrectLetters = 0
		
		while(@life>0 && countOfCorrectLetters<correctWord.length)
			
			#input from player		
			puts "\nGuess a letter: "
			inputLetter = gets.chomp.downcase
			
			#if more than one letter is entered
			if(inputLetter.length>1)
				puts "Enter single letter only!!!"
			
			#if the letter is included in the correctWord
			elsif(correctWord.include?(inputLetter) && !already_guessed.include?(inputLetter))
				correctWord.length.times { |i|  
					if( correctWord[i] == inputLetter)
						# As answerString is 2x length of correctWord with space seperated we require 2x indexing updation.
   						answerString[i*2]= inputLetter
   						# to track number of correctly filled blanks
   						countOfCorrectLetters = countOfCorrectLetters + 1
					end
				}

				already_guessed.push(inputLetter)

				print "Question Word : " + answerString
				puts "\n"
				print "Guessed Letters : " + already_guessed.to_s
			
		
			#if the letter is not included in the correctWord	
			else
				if(!already_guessed.include?(inputLetter))
					already_guessed.push(inputLetter)
					@life = @life-1
					show_hangman(@life,answerString,correctWord) 
			
				else
					puts "You have already guessed that letter. Please try another one."
				end

			end

			# final celebration for winning
			if(countOfCorrectLetters == correctWord.length)
				puts "\n\n"
				puts "CONGRATS!...You Won! Your amigo is saved and is grateful to you, " + @username
				puts "Hope you save more lives!!...."
				puts "Do play again!"
			end

		end
	
	end
end

#Instruction Module - included in Player Class
module Instruction
	def rules
		puts "\n"
		puts "Instruction"
		puts "--------------------------------------"
		puts "There will be number of dashes equivalent to the number of letters in the word."
		puts "You have to guess and suggests a letter that occurs in the word."
		puts "If the letter exists then it gets fills in the blanks with that letter in the right places."
		puts "Else, if the word does not contain the suggested letter, then OOPS! one element of Hangman’s gallows."
		puts "You have got 7 chances to save your amigo!"
		puts "ALL THE BEST!"
		puts "------------------------"
		puts "\n\n"
		puts "Press Yes to start the game...."

	end
end

#Class for player
class Player
	
	include Instruction
	include Hangman
	include ShowHangman

	def initialize(username)
		@username = username
		#initially each 
		@life = 7
	end

	attr_reader :username,:score
	attr_writer :username,:score

	def play_hangman
		show_question
	end
	
end

#entry point function
def start_game
	
	flag=1;

		puts "\n\n"
		puts "--------------------------"
		puts "H A N G M A N - G A M E"
		puts ' Knowledge coupled Fun '
		puts "--------------------------"

		puts "\n\n"
		puts "Enter your username:"
		username = gets.chomp
		
		puts "\n"
		puts "Hello, " + username
		puts "Lets get started!!"
		
	while(flag>0)

		player = Player.new(username)
		player.rules

		inputToStart = gets.chomp

		if(inputToStart == "Yes" || inputToStart == "YES" || inputToStart == "y" || inputToStart == "Y")
			puts "------------------------"
			player.play_hangman
		else
			flag=0;
		end

	end
	
end

start_game



