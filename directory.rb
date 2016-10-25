student_count = 11
#prints list of students

students = [
  "Dr. Hannibal Lecter",
"Darth Vader",
"Nurse Ratched",
"Michael Corleone",
"Alex DeLarge",
"The Wicked Witch of the West",
"Terminator",
"Freddy Krueger",
"The Joker",
"Joffrey Baratheon",
"Norman Bates"
]
puts "The students of Villains Academy"
puts "-"*10
students.each do |x|
  puts x
end

##How many do we have
puts "Overall we have #{students.count} great students"
