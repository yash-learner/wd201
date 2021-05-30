require "active_record"

class Todo < ActiveRecord::Base
  def due_today?
    due_date == Date.today
  end

  def to_displayable_string
    display_status = completed ? "[X]" : "[ ]"
    display_date = due_today? ? nil : due_date
    "#{display_status} #{todo_text} #{display_date}"
  end

  def self.to_displayable_list
    all.map { |todo| todo.to_displayable_string }
  end

  def self.show_list
  end

  def self.add_task(todo)
    Todo.create!(todo_text: todo[:todo_text], due_date: Date.today + todo[:due_in_days], completed: false)
  end

  def self.mark_as_complete(id)
    todo = Todo.find(id)
    todo.completed = true
    todo.save
    todo
  end
end
