require_relative 'uffmail_type'


class UffmailType3 < UffmailType
  def self.generate_uffmail(student_name)
    super
    student_name = student_name.downcase
    student_name  =student_name.split(' ')
    first_name = student_name[0]
    last_name = student_name[2]

    "#{first_name}#{last_name}@id.uff.br"
  end
end
