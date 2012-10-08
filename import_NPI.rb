require 'fileutils'

NPI = File.open('/home/frank/Tech/Cureatr/NPPES_Data_Dissemination_May_2011/npidata_20050523-20110509.csv', 'r')
file_counter = 0
outfile = File.open('/home/frank/Tech/Cureatr/NPPES_Data_Dissemination_May_2011/import_npi' + file_counter.to_s + '.sql', 'w')
outfile.puts 'INSERT INTO npi VALUES '

row_counter = 0
NPI.each do |line|
    outfile.puts '(' + line + '),'
    row_counter = row_counter + 1
    if row_counter >= 100000
        outfile.puts ';'
        row_counter = 0
        file_counter = file_counter + 1
        outfile.close
        outfile = File.open('/home/frank/Tech/Cureatr/NPPES_Data_Dissemination_May_2011/import_npi' + file_counter.to_s + '.sql', 'w')
    end
end

NPI.close
