require_relative 'uffmail_type1'
require_relative 'uffmail_type2'
require_relative 'uffmail_type3'
require_relative 'uffmail_type4'
require_relative 'uffmail_type5'

class UffmailGenerator
    def self.generate_uffmail(student_name, uffmail_type)
      #uffmail = ""
      case uffmail_type
      when 1
        uffmail = UffmailType1.generate_uffmail(student_name)
      when 2
        uffmail = UffmailType2.generate_uffmail(student_name)
      when 3
        uffmail = UffmailType3.generate_uffmail(student_name)
      when 4
        uffmail = UffmailType4.generate_uffmail(student_name)
      else
        uffmail = UffmailType5.generate_uffmail(student_name)
      end
      return uffmail
    end
end