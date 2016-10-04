class Imei::ImeiValidator
  attr_reader :number

  REGEX = /\A(\b\d{16}\b|\b\d{15}\b)\z/

  def self.valid?(number)
    new(number).valid?
  end

  def initialize(number)
    @number = number.to_s
  end

  def number=(number)
    @numbers = nil
    @number = number
  end

  def valid?
    return unless [15, 16].include?(number.size)
    ((rounded_sum - sum_numbers) == last_digit)
  end

  private

  def numbers
    @numbers ||= number.each_char.to_a.map(&:to_i)
  end

  def sum_numbers
    @sum_numbers ||= double_each_second_digit.join.each_char.to_a.map(&:to_i).inject(:+)
  end

  def double_each_second_digit
    arr = []
    iterator = 0
    numbers.each do |number|
      iterator += 1
      if iterator.odd?
        arr << number
      else
        arr << number*2
      end
    end
    return arr
  end

  def rest_of_division
    @rest_of_division ||= sum_numbers.modulo(10)
  end

  def rounded_sum
    @rounded_sum ||= ((sum_numbers - rest_of_division) + 10)
  end

  def last_digit
    @last_digit ||= numbers.pop
  end
end
