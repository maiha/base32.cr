module Base32
  CHARS_SAFE = "0123456789ABCDEFGHJKMNPQRSTVWXYZ"
  ENCODE_MAP = CHARS_SAFE.split(//)
  DECODE_MAP = Hash.zip(ENCODE_MAP, (0..31).to_a)

  def self.encode(number : Int) : String
    return "0" if number == 0_i64
    array = Array(String).new
    while number > 0_i64
      index  = number %  32_i64 # divmod is a bit slow
      number = number >> 5      # number / 32
      array << ENCODE_MAP[index]
    end
    return array.reverse.join
  end

  def self.decode(string) : Int
    total = 0_i64
    string.split(//).each_with_index do |char, i|
      value = DECODE_MAP[char]? || raise ArgumentError.new("Base32.decode([#{string}]) found unexpected char [#{char}] at [#{i}]")
      total = total * 32_i64 + value
    end
    return total
  end
end
