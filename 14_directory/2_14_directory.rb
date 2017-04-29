@students = [] #an empty array accessible to all methods

def print_menu
  puts "1. Input the students"
  puts "2. Show the students"
  puts "3. Save the list to students.csv"
  puts "4. Load the list from students.csv"
  puts "9. Exit" #9 because we'll be adding more items
end

def interactive_menu
  loop do
    print_menu
    process(STDIN.gets.chomp)
  end
end

def process(selection)
  case selection
  when "1"
    input_students
  when "2"
    show_students
  when "3"
    save_students
  when "4"
    load_students
  when "9"
    exit #this will cause the program to terminate
  else
    puts "I don't know what you mean, try again"
  end
end

def input_students
  puts "Please enter the names of the students"
  puts "To finish, just hit return twice"
  #get the first name
  name = STDIN.gets.chomp
  #while the name is not empty, repeat this code
  while !name.empty? do
    #add the student hash to the array
    @students << {name: name, cohort: :november}
    puts "Now we have #{@students.count} students"
    #get another name from the user
    name = STDIN.gets.chomp
  end
end

def show_students
  print_header
  print_student_list
  print_footer
end

def print_header
  puts "The students of Villains Academy"
  puts "-------------"
end

def print_student_list
  @students.each do |student|
    puts "#{student[:name]} (#{student[:cohort]} cohort)"
  end
end

def print_footer
  puts "Overall, we have #{@students.count} great students"
end

def save_students
  # open the file for writing
  file = File.open("students.csv", "w")
  #iterate over the array of students
  @students.each do |student|
    student_data = [student[:name], student[:cohort]]
    csv_line = student_data.join(",")
    file.puts csv_line #write the above line to the file
  end
  file.close #everytime you open the file it needs to be closed
end


def load_students(filename = "students.csv")
  file = File.open("students.csv", "r")
  file.readlines.each do |line|
    name, cohort = line.chomp.split(',')
    @students << {name: name, cohort: cohort.to_sym}
  end
  file.close
end


# Attempt 1:Why do I still need an if & elsif statement?
def try_load_students
  filename = ARGV.first #first argument from the command line
  if filename.nil? #if no file is given or if File exists then loads_students with the default csv file
    load_students(filename)
    puts "Loaded #{@students.count} from #{filename}"
  elsif File.exists?(filename)
    load_students(filename)
    puts "Loaded #{@students.count} from #{filename}"
    exit #quit the program
  end
end

#Observation 1:
#Attempted to reduced repetition with the below but this didn't work for try_load_students
# def try_load_students
#   filename = ARGV.first #first argument from the command line
#   if filename.nil? ||  File.exists?(filename)#if no file is given or if File exists then loads_students with the default csv file
#     load_students(filename)
#     puts "Loaded #{@students.count} from #{filename}"
#     exit #quit the program
#   end
# end

#Observation 2:
# The original method says: 'which methods do you need to change?'
# - Do I also need to change load_students? This has remained the same

# Observation 3:
# Attempt 1: I don't need an if /elsif statement if by default it will be assigned to filename
# Attempt 2: why doesn't this work? I get a 'loaded 4 from message in command line'
# def try_load_students
#   filename = ARGV.first
#   load_students(filename)
#   puts "Loaded #{@students.count} from #{filename}"
#   exit
# end

try_load_students
interactive_menu
