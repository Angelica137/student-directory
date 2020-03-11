#let the user input names


def input_students
  puts  "Please enter the names of the students"
  puts "To finish, just hit return twice"
  #create an empty array
  @students = []  
  #get the first name
  name = gets.chomp
  #while the name is not empty, repeat this code
  while !name.empty? do
    #add the student hash to the array
    @students << {name: name, cohort: :november}
    puts "Now we have #{@students.count} students"
    #get another name form the user
    name = gets.chomp
  end
  @students
end


#and then we print them
def print_header
  puts "The students of Villains Academy"
  puts "------------------"
end
def print(students)
  @students.each_with_index() do |student, i|
    index = i+1
    puts "#{index}: #{student[:name]} (#{student[:cohort]} cohort)"
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
    puts nil
  end
end

@students = input_students
print_header
print(@students)
print_footer(@students)
print_first_letter(@students)
print_short_name
