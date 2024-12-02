require 'csv'

class FileManager
    attr_accessor :csv_data
    
    def initialize(csv_file)
        read_data(csv_file)
    end

    def read_data(csv_file)
        @csv_data  = CSV.parse(File.read(csv_file), headers: true)
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

    def search_by_admission(required_admission)
        current_row = 0
        admissions_array = @csv_data.by_col[1]
        admissions_array.each do |admission|
            if admission.to_s == required_admission
                return @csv_data.by_row[current_row]
            end 
            current_row += 1
        end
        nil
    end
end