class Integer

  ROMAN = [['I','V'],['X','L'],['C','D'],['M']]

  def to_roman
    digits.reverse.each_with_index.map do |digit,position|
      digit_to_roman(digit,position)
    end.reverse.join
  end

  def digit_to_roman(digit,position)
    case digit
    when 1..3 then ROMAN[position][0] * digit
    when 4    then ROMAN[position].join
    when 5    then ROMAN[position][1]
    when 6..8 then ROMAN[position][1] + ROMAN[position][0] * (digit-5)
    when 9    then ROMAN[position][0] + ROMAN[position+1][0]
    end
  end

  def digits
    self.to_s.chars.map {|_| _.to_i}
  end

end
