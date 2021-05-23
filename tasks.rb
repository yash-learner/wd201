# TODO: TASK - 1

puts "TASK: 1"
names = [["Jhumpa", "Lahiri"], ["J. K", "Rowling"], ["Devdutt", "Pattanaik"]]
# fill in code that will return a new array of the full names:
#   ["Jhumpa Lahiri", "J.K Rowling", ...]

full_names = names.map {|x| x.join(" ")}
puts full_names
# print full_names - prints in single line
puts

# TODO: TASK - 2

puts "TASK: 2"
books = ["Design as Art", "Anathem", "Shogun"]
authors = ["Bruno Munari", "Neal Stephenson", "James Clavell"]
# fill in code that will print:
#   Design As Art was written by Bruno Munari
#   Anathem was written by Neal Stephenson
#   ...

# Solution 1:
puts "Solution 1:"
puts books.map {|x| x+" was written by "+ authors[books.index(x)]}
puts

# Solution 2 with_index :
puts "Solution 2 with_index:"
puts books.map.with_index {|book, i| "#{book} was written by #{authors[i]}"}
puts


# TODO: TASK - 3:

puts "TASK: 3"

todos = [
  ["Send invoice", "money"],
  ["Clean room", "organize"],
  ["Pay rent", "money"],
  ["Arrange books", "organize"],
  ["Pay taxes", "money"],
  ["Buy groceries", "food"]
]

# Fill in code that will print:
#   money:
#     Send invoice
#     Pay rent
#     Pay taxes
#   organize:
#     Clean room
#     Arrange books
#   food:
#     Buy groceries

display = [["money", ["organize", ]]]
money  = []
money = todos.select {|x| x[1] == "money"}
money.each {|x| puts x[0]}
