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
def print_students(array)
  array.each.with_index do |e, i|
    puts "#{i}: #{e[:name]}, #{e[:cohort]} cohort".center(50)
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
  print "Enter a name: "; name = gets.chomp
  print "Enter a cohort: "; cohort = get_cohort
  #until double return
  while name != ""
    students.push({name: name, cohort: cohort})
    puts "Now we have #{students.count} students"
    #get another name
    print "Enter a name: "; name = gets.chomp
    if !name.empty? then  print "Enter a cohort: "; cohort = get_cohort end
  end
  students
end


def get_cohort
  months = [:january, :february, :march, :april, :may, :june, :july, :august, :september, :october, :november, :december]
  cohort = gets.chomp
  if cohort.empty? || !months.include?(cohort.to_sym) then
     cohort = :november
   end
   cohort
end

def interactive_menu
  students = []
  puts "Please select an option, eg 1"
  puts "\t 1. Input student data"
  puts "\t 2. Display all students"
  puts "\t 3. Filter students buy first letter of name"
  puts "\t 9. Exit program"

  #selection = gets.chomp
  loop do
    print "What is your selection? "
    selection = gets.chomp
    case selection
    when "1"
      students = input_students
    when "2"
      print_header
      print_students(students)
      print_footer(students)
    when "3"
      print_only_specific(students)
    when "9"
      exit
    else
      puts "I don't understand, please enter a number"
    end
  end
end

interactive_menu
