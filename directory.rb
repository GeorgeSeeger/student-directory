students = [
  {name: "Dr. Hannibal Lecter", cohort:  :november},
  {name: "Darth Vader", cohort:  :november},
  {name: "Nurse Ratched", cohort:  :november},
  {name: "Michael Corleone", cohort:  :november},
  {name: "Alex DeLarge", cohort:  :november},
  {name: "The Wicked Witch of the West", cohort:  :november},
  {name: "Terminator", cohort:  :november},
  {name: "Freddy Krueger", cohort:  :november},
  {name: "The Joker", cohort:  :november},
  {name: "Joffrey Baratheon", cohort:  :november},
  {name: "Norman Bates", cohort:  :november}
]
def print_header
  puts "The students of Villains Academy"
  puts "-"*10
end
def print(array)
  array.each.with_index do |e, i|
    puts "#{i}: #{e[:name]}, #{e[:cohort]} cohort"
  end
end

def print_footer(names)
  puts "Overall we have #{names.count} great students"
end

def print_only_specific(students)
  print "Filter for names beginning with: "
  starting_char = gets.chomp.upcase
  puts "The only students with name beginning with #{starting_char} are:"
  students.each{ |e|
    if e[:name][0].upcase == starting_char then
      puts "#{e[:name]}"
    end
  }
end

def input_students
  puts "Please enter the names of the students"
  puts "To finish, hit return twice"
  #create empty array
  students = []
  #get names from user
  name = gets.chomp
  #until double return
  while name != ""
    students.push({name: name, cohort: :november})
    puts "No we have #{students.count} students"
  #get another name
    name = gets.chomp
  end
  students
end

#students = input_students
print_header
print_only_specific(students)
print_footer(students)
