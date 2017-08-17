require 'pry'
class CreditCheck
  def valid(card_number)
      check_cards(card_number)
      puts "The number is valid!" if @sum_of_card_numbers % 10 == 0
      puts  "The number is invalid!" if @sum_of_card_numbers % 10 != 0
  end

  def check_cards(card_number)
    count = 1
    @sum_of_card_numbers = 0
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
    @sum_of_card_numbers
  end
end
