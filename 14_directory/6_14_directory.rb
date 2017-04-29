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
  file = File.open("students.csv", "w") {|file| file.puts @csv_line } #should the block be at the top next to this?

  @csv_line = []
  @students.each do |student|
    student_data = [student[:name], student[:cohort]]
    @csv_line = student_data.join(",")
  end
end


def load_students(filename = "students.csv")
  file = File.open("students.csv", "r") { |file| file.lines} #this is incorrect- can't call readlines as a private method

  # #I think I need to assign the reult of this similar to above- however, I'm not 'puts' the result
  # lines = file.readlines.each do |line| ?? - but then where does lines var in the file read block?
    file.readlines.each do |line|
    name, cohort = line.chomp.split(',')
    @students << {name: name, cohort: cohort.to_sym}
    end
end


  def try_load_students
    filename = ARGV.first #first argument from the command line
    return if filename.nil? #get out of the method if it isn't given
    if File.exists?(filename)
      load_students(filename)
      puts "Loaded #{@students.count} from #{filename}"
    else #if it doesn't exist
      puts "Sorry, #{filename} doesn't exist."
      exit #quit the program
    end
  end



  try_load_students
  interactive_menu

# Documentation on opening & closing files using a block
  # https://ruby-doc.org/core-2.1.4/File.html#method-c-open
  #http://ruby.bastardsbook.com/chapters/io/
