class Student
    attr_accessor :name, :admission, :telephone, :email, :uffmail, :status

    def initialize(name:, admission:, telephone:, email:, uffmail: , status:)
        @name = name
        @admission = admission
        @telephone = telephone
        @email = email
        @uffmail = uffmail
        @status = status
      end
end