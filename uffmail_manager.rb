require_relative 'uffmail_generator'
require_relative 'student'

class UffmailManager
  attr_accessor :uffmail, :uffmail_type, :student

  def self.sendAlert
    puts "A criação de seu e-mail (#{@uffmail}) será feita nos próximos minutos."
  end

  def self.sendSMS()
    puts "Um SMS foi enviado para #{@student.telephone} com a sua senha de acesso."
  end

  def self.create_new_uffmail(student)
    @student = student
    @uffmail_type = validate_email_type
    @uffmail = UffmailGenerator.generate_uffmail(@student.name, @uffmail_type)
    @student.uffmail = @uffmail
    sendAlert
    sendSMS
  end

  def self.validate_email_type
    show_options
    uffmail_type = gets.to_i

    # Garantir tipo válido
    while uffmail_type < 1 || uffmail_type > 5
      puts "Tipo inválido para o email"
      show_options
      uffmail_type = gets.to_i
    end

    return uffmail_type
  end

  def self.show_options
    option_1 = UffmailGenerator.generate_uffmail(@student.name, 1)
    option_2 = UffmailGenerator.generate_uffmail(@student.name, 2)
    option_3 = UffmailGenerator.generate_uffmail(@student.name, 3)
    option_4 = UffmailGenerator.generate_uffmail(@student.name, 4)
    option_5 = UffmailGenerator.generate_uffmail(@student.name, 5)

    puts "#{@student.name}, por favor escolha uma das opções abaixo para o seu UFFMail"
    puts "1 - #{option_1}\n"+
    "2 - #{option_2}\n"+
    "3 - #{option_3}\n"+
    "4 - #{option_4}\n"+
    "5 - #{option_5}"
  end
end
