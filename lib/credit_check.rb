require 'pry'
class CreditCheck
  def valid(card_number)
      check_cards(card_number)
      puts "The number is valid!" if @sum_of_card_numbers % 10 == 0
      puts  "The number is invalid!" if @sum_of_card_numbers % 10 != 0
  end

  def american_express(card_number)
    check_cards(card_number)
    card_number[-1] = (10 - (@sum_of_card_numbers % 10)).to_s
    valid(card_number)
  end

  # private

    def check_cards(card_number)
      count = 1
      @sum_of_card_numbers = 0
      card_number << "0" if card_number.length <= 15
      card_number.split("").reverse.collect do |num|
         if count.odd?
           @sum_of_card_numbers += num.to_i
        elsif num.to_i * 2 > 9
          double = num.to_i * 2
          @sum_of_card_numbers += double.digits.reduce(:+)
        else
          @sum_of_card_numbers += num.to_i * 2
        end
        count += 1
      end
    end
end
