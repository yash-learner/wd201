def salute(name, greeting)
  name = name.split(" ")
  return "#{greeting} MR. #{name.last}"

end


puts salute("Nelson Rolihlahla Mandela", "hello")
puts salute("Sir Alan Turing", "welcome")
