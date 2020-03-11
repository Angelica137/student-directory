#let the user input names
def input_students
  puts  "Please enter the names of the students"
  puts "To finish, just hit return twice."
  #create an empty array
  @students = []  
  #get the first name
  name = gets.chomp
  #while the name is not empty, repeat this code
  while !name.empty? do
    #add the student hash to the array
#   @students << {name: name, cohort: :november}
# change the above hard code to allow user input cohort
# and added default value if empty
    puts "Enter their cohort"
    cohort = gets.chomp
    if cohort.empty?
      cohort = 'default'
    end
    #make string into symbol
    cohort.to_sym
    puts "What are their hobbies?"
    hobbies = gets.chomp
    puts "Enter their date of birth"
    dob = gets.chomp
    puts "Enter country of birth"
    country_of_birth = gets.chomp
    puts "Enter their height"
    height = gets.chomp
    @students << {name: name, 
      hobbies: hobbies, 
      dob: dob,
      country_of_birth: country_of_birth,
      height: height,
      cohort: cohort}
#      cohort = 'default' if cohort.nil?
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
def print(students)
#  count = 0
#  while count <= @students.length do
#    puts @students[count].center(18)#.key
#    count += 1
#  end
#used string to center text
    @students.each_with_index() do |student, i|
    index = i+1
      puts "#{index}. for #{student[:name]} (#{student[:cohort]} cohort)".center(150)
    end
end

#finally, we print the total number of students
def print_footer(students)
  puts "Overall, we have #{students.count} great students"
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



@students = input_students
print_header
print(@students)
print_footer(@students)
print_first_letter(@students)
print_short_name
print_cohort

#8. print users grouped by cohorts

