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
  puts "The only students with name beginning with #{starting_char}
  and length < 12  are:"
  students.each{ |e|
    if e[:name][0].upcase == starting_char && e[:name].length < 12 then
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
    puts "No we have #{students.count} students"
  #get another name
  print "Enter a name: "; name = gets.chomp
  print "Enter a cohort: "; cohort = get_cohort
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

students = input_students
print_header
print_students(students)
#print_only_specific(students)
print_footer(students)
