require_relative 'uffmail_generator'

module UffmailManager

  def self.create_new_uffmail(student)
    if validate_email_creation(student)
      uffmail_type = validate_email_type(student)
      uffmail = UffmailGenerator.generate_uffmail(student.name, uffmail_type)
      student.uffmail = uffmail
      send_alert(student.uffmail)
      send_sms(student.telephone)
    end
  end

  private

  def self.validate_email_creation(student)
    if !student.uffmail && student.status == 'Ativo'
      return true
    elsif student.uffmail
      puts 'Esse estudante já tem uffmail. Proibido criar outro.'
    else
      # Estudante sem uffmail e não ativo (no caso, inativo)
      puts 'Usuário inativo não pode criar uffmail.'
    end
    false
  end

  def self.send_alert(uffmail)
    puts "A criação de seu e-mail (#{uffmail}) será feita nos próximos minutos."
  end

  def self.send_sms(telephone)
    puts "Um SMS foi enviado para #{telephone} com a sua senha de acesso."
  end

  def self.validate_email_type(student)
    show_options(student)
    uffmail_type = gets.to_i

    # Garantir tipo válido
    while uffmail_type < 1 || uffmail_type > 5
      puts "Tipo inválido para o email"
      show_options(student)
      uffmail_type = gets.to_i
    end

    return uffmail_type
  end

  def self.show_options(student)

    option_1 = UffmailGenerator.generate_uffmail(student.name, 1)
    option_2 = UffmailGenerator.generate_uffmail(student.name, 2)
    option_3 = UffmailGenerator.generate_uffmail(student.name, 3)
    option_4 = UffmailGenerator.generate_uffmail(student.name, 4)
    option_5 = UffmailGenerator.generate_uffmail(student.name, 5)

    puts "#{student.name}, por favor escolha uma das opções abaixo para o seu UFFMail"
    puts "1 - #{option_1}\n"+
    "2 - #{option_2}\n"+
    "3 - #{option_3}\n"+
    "4 - #{option_4}\n"+
    "5 - #{option_5}"
  end
end