require_relative 'uffmail_type'

class UffmailType1 < UffmailType
  def self.generate_uffmail(student_name)
    super
    student_name = student_name.downcase
    student_name  =student_name.split(' ')
    first_name = student_name[0]
    middle_name = student_name[1]

    "#{first_name}_#{middle_name}@id.uff.br"
  end
end