def calculate (cards)
	arr = cards.map {|e| e[1]}
	# new array of cards with 
	total = 0
	arr.each do |value|
		if value.to_i == 0 && value !=  'Ace'
			total += 10
		elsif value.to_i == 0 && value == 'Ace'
			total += 11
		else
			total += value.to_i
		end
	end
	# correct for Aces : glanced at solutions for this step!
	if arr.include?('Ace') && total > 21
		total -= 10
	end
	total
end


faces = %w(2 3 4 5 6 7 8 9 10 Jack Queen King Ace)
suits = %w(Spades Hearts Clubs Diamonds)

deck = suits.product(faces)

deck.shuffle!

player = []
dealer = []

player << deck.pop
dealer << deck.pop
player << deck.pop
dealer << deck.pop


player_total = calculate(player)
dealer_total = calculate(dealer)

puts "Lets play blackjack!"
puts "You have #{player} and your total is #{player_total}"
puts "Dealer has #{dealer} and the dealers total is #{dealer_total}"



if player_total == 21
	puts "Congrats! You won!!"
	exit
elsif dealer_total == 21
	puts "Dealer wins"
	exit
elsif player_total && dealer_total == 21
	puts "It's a tie!"
	exit
end

puts "Player goes first..."

while player_total < 21
	puts "Your total is #{player_total}"
	puts "What would you like to do: hit or stay?"
	player_choice = gets.chomp
	if player_choice == "hit"
		player << deck.pop
		puts "Now your hand is #{player}"
		player_total = calculate(player)
	elsif player_choice == "stay"
		break
	end
end

if player_total > 21
	puts "Your total is #{player_total}"
	puts "Bust! Sorry you lose"
	exit
end


puts "Now it's the dealers turn!"

dealer_total = calculate(dealer)

while dealer_total < 17
	puts "Dealer choses to hit!"
	dealer << deck.pop
	puts "Now the Dealers hand is #{dealer}"
	dealer_total = calculate(dealer)
	puts "The Dealers total is now #{dealer_total}"

	if dealer_total == 21
		puts "The Dealers total is #{dealer_total}"
		puts "Dealer Wins!!"
		exit

	elsif dealer_total > 21
		puts "The Dealers total is #{dealer_total}"
		puts "Dealer Bust. You win"	
		exit
	end
end

if 17 <= dealer_total && dealer_total < 21
	puts "The Dealers total is #{dealer_total}"
	puts "The Dealer decides to stay"
end


puts "Now lets compare cards"

if dealer_total > player_total
	puts "The Dealers total is #{dealer_total}"
	puts "Your total is #{player_total}"
	puts "The Dealer Wins"
elsif dealer_total < player_total
	puts "The Dealers total is #{dealer_total}"
	puts "Your total is #{player_total}"
	puts "Congrats! You win."
elsif dealer_total == player_total
	puts "The Dealers total is #{dealer_total}"
	puts "Your total is #{player_total}"
	puts "It's a tie!"
end

