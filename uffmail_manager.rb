require_relative 'uffmail_generator'
require_relative 'file_manager'

module UffmailManager

  def self.create_new_uffmail(student, file_manager)
    if validate_email_creation(student)
      # Gera opções de uffmail e depois escolhe uma delas
      options = UffmailGenerator.generate_uffmail_options(student.name)
      uffmail_type = select_email_type(student.name, options)

      uffmail = options[uffmail_type-1] # Opção n está na posição n-1
      student.uffmail = uffmail

      send_alert(student.uffmail)
      file_manager.update_uffmail(student.admission, student.uffmail)
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

  def self.select_email_type(student_name, options)
    show_options(student_name, options)
    uffmail_type = validate_email_type(student_name, options)
    uffmail_type
  end

  def self.show_options(student_name, options)
    puts "#{student_name}, por favor escolha uma das opções abaixo para o seu UFFMail"
    (0..options.length - 1).each do |i|
      puts "#{i+1} - #{options[i]}"
    end
  end

  def self.validate_email_type(student_name, options)
    uffmail_type = gets.to_i

    # Garantir tipo válido
    while uffmail_type < 1 || uffmail_type > 5
      puts "Tipo inválido para o email"
      show_options(student_name, options)
      uffmail_type = gets.to_i
    end

    uffmail_type
  end

  def self.send_alert(uffmail)
    puts "A criação de seu e-mail (#{uffmail}) será feita nos próximos minutos."
  end

  def self.send_sms(telephone)
    puts "Um SMS foi enviado para #{telephone} com a sua senha de acesso."
  end
end