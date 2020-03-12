@students = [] #an empty array accessible to all methods

#let the user input names
def input_students
  puts  "Please enter the names of the students"
  puts "To finish, just hit return twice."
  #create an empty array
#  @students = []  
  #get the first name
  #10. Replace chomp for a different method
  name = gets.strip
  #while the name is not empty, repeat this code
  while !name.empty? do

    puts "Enter their cohort"
    cohort = gets.strip
    if cohort.empty?
      cohort = 'default'
    end
    #make string into symbol
    cohort.to_sym
    #add extra information
    puts "What are their hobbies?"
    hobbies = gets.strip
    puts "Enter their date of birth"
    dob = gets.strip
    puts "Enter country of birth"
    country_of_birth = gets.strip
    puts "Enter their height"
    height = gets.strip

    #add the student hash to the array
    @students << {name: name, 
      hobbies: hobbies, 
      dob: dob,
      country_of_birth: country_of_birth,
      height: height,
      cohort: cohort}

    if @students.count != 1
      puts "Now we have #{@students.count} students"
    else
      puts "Now we have #{@students.count} student"
    end
    #try to add extra information once student list has been created.
    puts "Do you want to add another student? To finish hit return twice."
    #get another name from the user
    name = gets.chomp
  end
  @students
end

#and then we print them
def print_header
  puts "The students of Villains Academy".center(150)
  puts "------------------".center(150)
end

#replaced iterator with while loop. Think iterator is better. Check and amend if 
#needed
def print_student_list
#  count = 0
#  while count <= @students.length do
#    puts @students[count].center(18)#.key
#    count += 1
#  end
#used string to center text
    @students.each_with_index() do |student, i|
    index = i+1
      puts "#{index}. #{student[:name]} (#{student[:cohort]} cohort)".center(150)
    end
end

#finally, we print the total number of students
def print_footer
  puts "Overall, we have #{@students.count} great students".center(150)
end

def print_first_letter(prefix)
  puts "Enter the first letter of the name you are looking for"
  prefix = gets.chomp
  puts @students.select { |student| student[:name].start_with? prefix}
  #this only works if prefix is with capital, need to fix it so it works for non capitals too
end

def print_short_name
  puts "Want to see short names?"
  answer = gets.chomp
  if answer == 'yes'
    puts @students.select { |student| student[:name].length < 12}
  else
    print nil
  end
end

def print_cohort
  puts "Enter cohort to search."
  cohort = gets.chomp

  @students.each do |hash|
    if hash[:cohort] == cohort
      puts hash
    end
  end
end

#create interarctive method
def print_menu
  puts "1. Input the students"
  puts "2. Show the students"
  puts "3. Save the list to students.csv"
  puts "9. Exit"
end

def show_students
  print_header
  print_student_list
  print_footer
end

def process(selection)
  case selection
    when "1"
      students = input_students
    when "2"
      show_students
    when "3"
      save_students
    when "9"
      exit
    else
      puts "I do not know what yo meant, try again"
    end
end

def interactive_menu
  loop do
    print_menu
    process(gets.chomp)
  end
end

def save_students
  #open the file for writing
  file = File.open("students.csv", "w")
  #iterate over the array of students
  @students.each do |student|
    #for each hash, we create a new array
    student_data = [student[:name], student[:cohort]]
    #then we convert it to a comma separated string
    csv_line = student_data.join(",")
    #write the var csv_line to the file using puts
    #this puts it to the file and not the screen
    file.puts csv_line
  end
  file.close
end

interactive_menu
