require 'csv'

class FileManager
    attr_accessor :csv_data, :csv_file
    
    def initialize(csv_file)
        @csv_file = csv_file

        read_data
    end

    def show_data
        @csv_data.each do |row|
            (0..5).each do |j|
                print row[j]
                if j != 5
                    print " - "
                end
            end
            puts
        end
    end

    def select_by_admission(required_admission)
        student_row = search_by_admission(required_admission)
        return @csv_data[student_row] if student_row != -1
        nil
    end

    def update_uffmail(student_admission, student_uffmail)
        student_row = search_by_admission(student_admission)
        @csv_data[student_row]["uffmail"] = student_uffmail
        update_csv_data
    end

    private

    def read_data
        @csv_data = CSV.parse(File.read(@csv_file), headers: true)
    end

    def search_by_admission(required_admission)
        current_row = 0
        admissions_array = @csv_data.by_col[1]
        admissions_array.each do |admission|
            if admission.to_s == required_admission
                return current_row
            end
            current_row += 1
        end
        -1
    end

    def update_csv_data
        headers = ["nome","matricula","telefone","email","uffmail","status"]
        CSV.open(csv_file, 'w') do |csv|
            csv << headers
            @csv_data.each do |row|
                csv << row
            end
        end
    end
end