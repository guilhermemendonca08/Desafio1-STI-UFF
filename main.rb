require_relative 'file_manager'
require_relative 'student'
require_relative 'uffmail_manager'

FILE = "alunos.csv"
fileManager = FileManager.new(FILE)

puts "Insira sua matrícula:"
admission = gets.chomp

studentData = fileManager.searchByAdmission(admission)

if studentData.nil?
    puts("Estudante não cadastrado.")
    return
end


student = Student.new(
    name: studentData[0],
    admission: studentData[1],
    telephone: studentData[2],
    email: studentData[3],
    uffmail: studentData[4],
    status: studentData[5],
    )

# puts "Olá, #{student.name}, matrícula #{student.admission}"

if !student.uffmail && student.status == 'Ativo'
    UffmailManager.create_new_uffmail(student)
    # puts "O uffmail de #{student.name} é: #{student.uffmail}"

elsif student.uffmail
    puts 'Esse estudante já tem uffmail. Proibido criar outro.'

else
    # Estudante sem uffmail e não ativo (no caso, inativo)
    puts 'Usuário inativo não pode criar uffmail.'
end

