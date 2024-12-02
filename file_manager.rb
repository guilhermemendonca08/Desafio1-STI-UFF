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
        for line in @csv_data
            (0..5).each do |j|
                print line[j]
                if j != 5
                    print " - "
                end
            end
            puts
        end
    end

    def search_by_admission(required_admission)
        current_line = 0
        admissions_array = @csv_data.by_col[1]
        for admission in admissions_array
            if admission.to_s == required_admission
                return @csv_data.by_row[current_line]
            end 
            current_line += 1
        end
        nil
    end
end