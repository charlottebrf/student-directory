def centers(str)
  puts str.center(150)
end
#Exercise 8:6 see note at the end on refactoring this method

def asks_question(question)
  centers("Please enter the #{question} of the student:")
  answer = gets.chomp
  if answer.empty?
    "none"
  else
    answer
  end
end

def gets_name()
  asks_question("names")
end

def gets_age()
  asks_question("age")
end

def gets_nationality()
  asks_question("nationalities")
end

def gets_studies()
  asks_question("previous studies")
end

COHORTS_HASH = {"january" => :january, "february" => :february, "march" => :march, "april" => :april, "may" => :may, "june" => :june, "july" => :july, "august" => :august, "september" => :september, "october" => :october, "november" => :november, "december" => :december}

def gets_cohort()
  answer = asks_question("cohort").downcase
  if COHORTS_HASH.has_key?(answer)
    COHORTS_HASH[answer]
  else
    "none"
  end
end

def get_student()
  name = gets_name()
  age = gets_age()
  nationality = gets_nationality()
  studies = gets_studies()
  cohort = gets_cohort()

  if name == "none" && age == "none" && nationality == "none" && studies == "none" && cohort == "none"
    :no_student
  else
    {name: name, age: age, nationality: nationality, studies: studies, cohort: cohort}
  end
end

def print_student_count(students)
  if students.count == 1
    centers("Now we have #{students.count} student")
  else
    centers("Now we have #{students.count} students")
  end
end

def input_students()
  students = []
  student = get_student()
  while student != :no_student do
    students << student
    print_student_count(students)

    if exit_program?()
      student = :no_student
    else
      student = get_student()
    end
  end
  students
end

def exit_program?()
  centers("To stop answering questions about students and quit press 'Q'.")
  answer = gets.chomp
  if answer == "Q"
    true
  else
    false
  end
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
