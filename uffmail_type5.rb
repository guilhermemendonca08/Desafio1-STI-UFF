require_relative 'uffmail_type'


class UffmailType5 < UffmailType
  def self.generate_uffmail(student_name)
    super
    student_name = student_name.downcase
    student_name  =student_name.split(' ')
    first_letter_first_name = student_name[0][0]
    middle_name = student_name[1]
    last_name = student_name[2]

    "#{first_letter_first_name}#{middle_name}#{last_name}@id.uff.br"
  end
end
