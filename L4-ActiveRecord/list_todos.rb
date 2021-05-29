require "./connect_db"
require "./todo"
connect_db!

displayable_list = Todo.all.map { |todo| todo.to_displayable_string }
puts displayable_list
