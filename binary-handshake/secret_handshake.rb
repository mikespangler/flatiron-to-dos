class SecretHandshake

  attr_reader :binary, :words

  def initialize(binary_as_string)
    @binary = binary_as_string.to_i(2)
    @words = ["wink", "double blink", "close your eyes", "jump"]
  end

  def commands
    i = -1
    response = words.select do
      self.bit_set?((i += 1))
    end
    self.bit_set?(4) ? response.reverse : response
  end

  def bit_set?(position)
    (binary & 2**position) == 2**position
  end

end