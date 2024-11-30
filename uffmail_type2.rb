require_relative 'uffmail_type'


class UffmailType2 < UffmailType
  def self.generate_uffmail(student_name)
    super
    student_name = student_name.downcase
    student_name  =student_name.split(' ')
    first_name = student_name[0]
    first_letter_middle_name = student_name[1][0]
    first_letter_second_name = student_name[2][0]

    "#{first_name}#{first_letter_middle_name}#{first_letter_second_name}@id.uff.br"
  end
end