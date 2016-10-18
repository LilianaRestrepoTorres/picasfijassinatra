#Picas y Fijas

guessed_number = []

begin
    begin
        num = rand(10)
    end while guessed_number.include?(num)
    guessed_number.push(num)
end while guessed_number.size < 4

#puts guessed_number
guess = false

while guess == false
    repeat = false
    while repeat == false
        puts "Give me one number of the four digits"
        number_user = gets.chomp

        array_user = number_user.split("").map(&:to_i)

        repeat_number = 0
        k = 0

        until k == array_user.length
          repeat_number = array_user.count(array_user[k])
          k += 1
        end

        if repeat_number > 1
          puts "No puede ingresar numeros repetidos"
        else
          repeat = true
        end
    end
        puts array_user

        i = 0
        fijas = 0
        picas = 0

        until i == guessed_number.length
          if guessed_number [i] == array_user [i]
            fijas += 1
          elsif guessed_number.include?(array_user[i])
            picas += 1
          end
          i += 1
        end

        puts "Fijas: #{fijas}"
        puts "Picas: #{picas}"

        if fijas == 4
          puts "Congratulations, this is the number! #{guessed_number}"
          guess = true
        else
          puts "Try again.."
        end
end
