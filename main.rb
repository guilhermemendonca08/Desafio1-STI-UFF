require_relative 'file_manager'
require_relative 'student'
require_relative 'uffmail_manager'

FILE = "db/alunos.csv"
file_manager = FileManager.new(FILE)

puts "Insira sua matrícula:"
admission = gets.chomp

student_data = file_manager.select_by_admission(admission)

if student_data.nil?
  puts("Estudante não cadastrado.")
  return
end

student = Student.new(
  name: student_data[0],
  admission: student_data[1],
  telephone: student_data[2],
  email: student_data[3],
  uffmail: student_data[4],
  status: student_data[5],
  )

UffmailManager.create_new_uffmail(student, file_manager)

# puts "O uffmail de #{student.name} é: #{student.uffmail}" if student.uffmail