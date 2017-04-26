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
    if students.count == 1
      centers("Now we have #{students.count} student")
    else
      centers("Now we have #{students.count} students")
    end
    name = gets.chomp
    age = gets.chomp
    nationality = gets.chomp
    studies = gets.chomp
  end
  #return the array of students
  students
end


#Exercise 7: commented out workings
# def input_students
#
#  student_answers = []
#   student_answers << name = "charlotte"
#   student_answers << age = 18
#   student_answers << nationality = "British"
#   student_answers << studies = ""
#   student_answers << cohort = "November"
#
#   default_answers = []
#   student_answers.each do |answer|
#     if answer == ""
#       default_answers <<  answer = "none"
#   end
# end
#
#   p default_answers
#
# end

#   student_answers << {name: name, age: age, nationality: nationality, studies: studies, cohort: cohort}
#   p student_answers


#   empty_keys = []
#   student_answers.each do |answer|
#     answer.each do |key, value|
#       if value == ""
#       empty_keys << key
#     end
#   end
# end

# p empty_keys



# #take each key & reassign it to a new hash with a default answer
# default_answers = []
# empty_keys.each do |key|
#   if key[name] == true
#   default_answers << name_hash = {name => "Codey Mc CodeFace"}
#   elsif key[age] == true
#   default_answers << age_hash = {age => 21}
#   elsif key[nationality] == true
#   default_answers << nationality_hash = {nationality => "Mexican"}
#   elsif key[studies] == true
#   default_answers << studies_hash = {studies => "Makers academy"}
#   elsif key[cohort] == true
#   default_answers cohort_hash = {cohort => "November"}
# end

# p default_answers
# end


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
  if students.count == 1
    centers("Overall, we have #{students.count} great student")
  else
    centers("Now we have #{students.count} students")
  end
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
