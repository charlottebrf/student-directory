@students = [] #an empty array accessible to all methods

#A method that puts a string & reused to output different strings throughout the program
def displays_string(string)
  puts "#{string}"
end

def print_menu
  displays_string("1. Input the students")
  displays_string("2. Show the students")
  displays_string("3. Save the list to students.csv")
  displays_string("4. Load the list from students.csv")
  displays_string("9. Exit") #9 because we'll be adding more items
end

def interactive_menu
  loop do
    print_menu
    processes_selection(STDIN.gets.chomp)
  end
end

#Separated all of the different selection options into methods- allowing individual methods to be easily changed
#which invoke the different methods separately
def selects_1(selection)
  if selection == "1"
    input_students()
  end
end

def selects_2(selection)
  if selection ==  "2"
    show_students()
  end
end

def selects_3(selection)
  if selection == "3"
    save_students()
  end
end

def selects_4(selection)
  if selection == "4"
    load_students()
  end
end

def selects_9(selection)
  if selection == "9"
    exit
  end
end

# Checks if the selection is empty first & gives error message if it is
# Else invokes all the methods with the different selection options
#Renames the method to be clearer
#Overall this method only carred out higher level functions

def processes_selection(selection)
  if selection.empty?
    displays_string("I don't know what you mean, try again")
  else
    selects_1(selection)
    selects_2(selection)
    selects_3(selection)
    selects_4(selection)
    selects_9(selection)
  end
end


def gets_name
  displays_string("Please enter the names of the students")
  displays_string("To finish, just hit return twice")
  STDIN.gets.chomp
end

def stores_cohort
  :november
end

def stores_student
  name = gets_name()
  cohort = stores_cohort()

  if name == ""
    :no_student
  else
    {name: name, cohort: cohort}# the error is with the conversion of the cohort to a symbol cohort.to_sym
  end
end


def input_students
  #get the first student
  student = stores_student()
  #while the student name is not empty, repeat this code
  while student != :no_student do
    @students << student #add the student to the array of students
    displays_string("Now we have #{@students.count} students")
    #get another student from the user
    student = stores_student()
  end
end

def show_students
  print_header
  print_student_list
  print_footer
end

def print_header
  displays_string("The students of Villains Academy")
  displays_string("-------------")
end

def print_student_list
  @students.each do |student|
    displays_string("#{student[:name]} (#{student[:cohort]} cohort)")
  end
end

def print_footer
  displays_string("Overall, we have #{@students.count} great students")
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


#From exercise:1: Have refactored code but haven't got rid of all repetition- this method has remained the same
#Technically stores_student is no serving a different purpose to l.110?

def load_students(filename = "students.csv") #takes the csv file
  file = File.open("students.csv", "r") #opens the file to read it
  file.readlines.each do |line| #read all lines into an array- iterate over each element
    name, cohort = line.chomp.split(',') #discard \n at end, split it at comma- now an array with 2 elements: name : cohort
    @students << {name: name, cohort: cohort.to_sym} #create new hash put it into students  #does that need to be shoveled in?
  end
  file.close
end


def try_load_students
  filename = ARGV.first #first argument from the command line
  return if filename.nil? #get out of the method if it isn't given
  if File.exists?(filename)
    load_students(filename)
    displays_string("Loaded #{@students.count} from #{filename}")
  else #if it doesn't exist
    displays_string("Sorry, #{filename} doesn't exist.")
    exit #quit the program
  end
end




try_load_students
interactive_menu
