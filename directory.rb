def centers(str)
  puts str.center(150)
end
#Exercise 8:6 see note at the end on refactoring this method

def asks_question(question)
  centers("Please enter the #{question} of the students")
end

def input_students
  asks_question("names")
  asks_question("ages")
  asks_question("nationalities")
  asks_question("previous studies")
  centers("To finish, just hit return five times")
  #Exercise 8:5: refactor the code so that you don't have to hit return 5 times & perhaps to have each question appear separately, rather than as a list at the top

  #create an empty array
  students = []
  #get the first name
  name = gets.chomp
  age = gets.chomp
  nationality = gets.chomp
  studies = gets.chomp
  #while the name is not empty, repeat this code
  while !name.empty? && !age.empty? && !nationality.empty? && !studies.empty? do
    #add the student hash to the array
    students << {name: name, age: age, nationality: nationality, studies: studies, cohort: :november}
    centers("Now we have #{students.count} students")
    name = gets.chomp
    age = gets.chomp
    nationality = gets.chomp
    studies = gets.chomp
  end
  #return the array of students
  students
end


def sorts_students(students)
  sorted_students = []
  students.each do |student|
    name = student[:name]
    if name.length < 12
      sorted_students << student
    end
  end
  sorted_students
end


def print_header
  centers("The students of Villains Academy")
  centers("-------------")
end

def print(students)

  index = 0

  while index < students.length do
    centers("#{index + 1}. #{students[index][:name]}, #{students[index][:age]}, #{students[index][:nationality]}, #{students[index][:studies]} (#{students[index][:cohort]} cohort)")
    index += 1
  end
end

def print_footer(students)
  centers("Overall, we have #{students.count} great students")
end



#nothing happens until we call the methods
students = input_students
students = sorts_students(students)
print_header
print(students)
print_footer(students)


#Exercise 8:6
# Refactor code to get the width of the terminal to use instead of a hard coded number, as I'm doing here. So as I/users resize terminal to a different width the text will still appear to be justified.
# Require 'curses' didn't work

# require 'curses'

# def centers(str)
#   puts str.center(Width)
# end

# screen = Curses.init_screen
# Width = screen.maxx
# height = screen.maxy
# Curses.init_screen()
