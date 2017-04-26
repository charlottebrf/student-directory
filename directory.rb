def input_students
  asks_question("names")
  asks_question("ages")
  asks_question("nationalities")
  asks_question("previous studies")
  puts "To finish, just hit return five times"
  #refactor the code so that you don't have to hit return 5 times & perhaps to have each question appear separately, rather than as a list at the top
  
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
    puts "Now we have #{students.count} students"
    name = gets.chomp
    age = gets.chomp
    nationality = gets.chomp
    studies = gets.chomp
  end
  #return the array of students
  students
end

def asks_question(question)
  puts "Please enter the #{question} of the students"
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
  puts "The students of Villains Academy"
  puts "-------------"
end

def print(students)

  index = 0

  while index < students.length do
    puts "#{index + 1}. #{students[index][:name]}, #{students[index][:age]}, #{students[index][:nationality]}, #{students[index][:studies]} (#{students[index][:cohort]} cohort)"
    index += 1
  end
end

def print_footer(students)
  puts "Overall, we have #{students.count} great students"
end

#nothing happens until we call the methods
students = input_students
students = sorts_students(students)
print_header
print(students)
print_footer(students)
