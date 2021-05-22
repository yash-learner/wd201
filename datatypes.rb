count = 24
course = "WD201"
is_live =true
lessons = ["Basic", "Intermediate", "Advanced"]

puts " Count: #{count}\n Course: #{course}\n is_live : #{is_live}\n lessons: #{lessons}"


nums = [1,2,3,4,5,6]

puts " The average of numbers is #{nums.sum / nums.length}"
puts " The average of numbers is #{nums.sum.to_f / nums.length}"
puts " The average of numbers is #{nums.sum.to_f / nums.length.to_f}"
puts " The average of numbers is #{nums.sum / nums.length.to_f}"



puts
puts " Division:"
puts 5/2
puts 5.0 / 2.0
puts 5.0 / 2
puts 5 / 2.0


puts "--------- Strings ----------"
str = "All is Well!"
puts str
puts str.length
puts str.upcase
puts str.downcase
puts str.capitalize


puts "--------- Boolean ----------"
puts 1 == 1
puts "this" == "this"
puts 1 < 2
puts 1 > 2
puts 42 >= 42


puts "Fiction or non-fiction"
genre = gets.chomp.downcase

if genre == "fiction"
  puts "Try reading Cryptonomicon by Neal Stephenson"
elsif genre == "non-fiction"
  puts "You should read The Ascent of Man by Jacob Bronowski!"
else
  puts "Oh I don't know about that genre"
end
