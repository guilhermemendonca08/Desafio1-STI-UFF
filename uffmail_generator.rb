module UffmailGenerator

    def self.generate_uffmail_options(student_name)
      student_name = student_name.downcase
      student_name = student_name.split(' ')

      first_name = student_name[0]
      middle_name = student_name[1]
      last_name = student_name[2]

      first_letter_first_name = student_name[0][0]
      first_letter_middle_name = student_name[1][0]
      first_letter_second_name = student_name[2][0]

      options = [
        "#{first_name}_#{middle_name}@id.uff.br",
        "#{first_name}#{first_letter_middle_name}#{first_letter_second_name}@id.uff.br",
        "#{first_name}#{last_name}@id.uff.br",
        "#{first_letter_first_name}#{last_name}@id.uff.br",
        "#{first_letter_first_name}#{middle_name}#{last_name}@id.uff.br"
      ]

      options
    end
end