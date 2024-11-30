require 'csv'

class FileManager
    attr_accessor :csvData 
    
    def initialize(csvFile)
        readData(csvFile)
    end

    def readData(csvFile)
        @csvData = table = CSV.parse(File.read(csvFile), headers: true)
    end

    def showData() # tirar dps
        for line in @csvData
            (0..5).each do |j|
                print line[j]
                if(j != 5)
                    print " - "
                end
            end
            puts
        end
    end

    def searchByAdmission(requiredAdmission)
        currentLine = 0
        admissionsArray = @csvData.by_col[1]
        for admission in admissionsArray
            if (admission.to_s == requiredAdmission)
                return @csvData.by_row[currentLine]
            end 
            currentLine += 1

        end
        return nil
    end

end

# Apagar depois

=begin
fileManager.showData
puts fileManager.csvData[1][1]
puts fileManager.csvData.by_col[0]
puts fileManager.csvData[1][0] Nicolas, na linha 1 e coluna 0
fileManager.showData
=end 
