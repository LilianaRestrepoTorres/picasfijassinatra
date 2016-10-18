class PicasFijas
  attr_accessor :array_user, :guessed_number, :fijas, :picas
  def initialize
    @array_user=[]
    @guessed_number=[]
    @fijas=0
    @picas=0
  end

#generates a 4 digits number with no repeats

  def generate_number
    begin
        begin
            num = rand(10)
        end while @guessed_number.include?(num)
        @guessed_number.push(num)
    end while @guessed_number.size < 4
  end

  def format_cookie_number(number)
    @guessed_number= number.split("&").map(&:to_i)

  end

  def format_user_number(number)
    @array_user = number.split("").map(&:to_i)
  end

  def fijas_picas
    i = 0
    until i == @guessed_number.length
      if @guessed_number [i] == @array_user [i]
        @fijas += 1
      elsif @guessed_number.include?(@array_user[i])
        @picas += 1
      end
      i += 1
    end
  end
end

# pc = PicasFijas.new
# pc.generate_number
# puts pc.guessed_number
# puts "*********"
#
# pc.format_user_number(1234.to_s)
# puts pc.array_user
# puts "*********"
#
# pc.fijas_picas
# puts pc.fijas
# puts pc.picas
