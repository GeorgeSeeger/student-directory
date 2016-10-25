@students = []

def print_header
  puts "The students of Villains Academy"
  puts "-"*10
end
def print_students(array)
  array.each.with_index do |e, i|
    puts "#{i+1}: #{e[:name]}, #{e[:cohort]} cohort".center(50)
  end
end

def print_footer(names)
  puts "Overall we have #{names.count} great students"
end

def print_only_specific
  print "Filter for names beginning with: "
  starting_char = STDIN.gets.chomp.upcase
  puts "The only students with name beginning with #{starting_char} are:"
  @students.each{ |e|
    if e[:name][0].upcase == starting_char then
      puts "#{e[:name]}"
    end
  }
end

def input_students
  puts "Please enter the names of the students"
  puts "To finish, hit return twice"
  #get names from user
  print "Enter a name: "; name = STDIN.gets.chomp
  print "Enter a cohort: "; cohort = get_cohort
  #until double return
  while name != ""
    @students.push({name: name, cohort: cohort})
    puts "Now we have #{@students.count} students"
    #get another name
    print "Enter a name: "; name = STDIN.gets.chomp
    if !name.empty? then  print "Enter a cohort: "; cohort = get_cohort end
  end
end

def save_students
    file = File.open("students.csv", "w")
    @students.each{ |e|
      student_data = [ e[:name], e[:cohort]]
      csv_line = student_data.join(", ")
      file.puts(csv_line)
    }
    file.close
end

def get_cohort
  months = [:january, :february, :march, :april, :may, :june, :july, :august, :september, :october, :november, :december]
  cohort = STDIN.gets.chomp
  if cohort.empty? || !months.include?(cohort.to_sym) then
     cohort = :november
   end
   cohort
end

def print_menu
  puts "Please select an option, eg 1"
  puts "\t 1. Input student data"
  puts "\t 2. Display all students"
  puts "\t 3. Save the list to students.csv"
  puts "\t 4. Loads the list from students.csv"
  puts "\t 5. Filter students buy first letter of name"
  puts "\t 9. Exit program"
end

def show_students
  print_header
  print_students(@students)
  print_footer(@students)
end

def load_students(filename = "students.csv")
  file = File.open(filename, "r")
  file.readlines.each{ |line|
    name, cohort = line.chomp.split(", ")
    @students.push( {name: name, cohort: cohort.to_sym})
  }
  file.close
end

def try_load_students
  if ARGV[0] != nil
    filename = ARGV[0]
    if File.exists?(filename)
      load_students(filename)
      puts "Loaded #{@students.count} from #{filename}"
     else # if it doesn't exist
       puts "Sorry, #{filename} doesn't exist."
       exit # quit the program
     end
   end
end

def process
  print "What is your selection? "
  selection = STDIN.gets.chomp
  case selection
  when "1"
    input_students
  when "2"
    show_students
  when "3"
    save_students
  when "4"
    load_students
  when "5"
    print_only_specific
  when "9"
    exit
  else
    puts "I don't understand, please enter a number"
  end
end

def interactive_menu
  try_load_students
  loop do
    print_menu
    process
  end
end

interactive_menu
