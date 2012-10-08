require 'fileutils'

sql = File.open('../../Cureatr/NPI_Table_Create.sql', 'r')
sql_filtered = File.open('../../Cureatr/NPI_Create_Table2.sql','w')

alphabet = ('A'..'Z').to_a
temp = alphabet.dup
alphabet.each do |letter|
    alphabet.each do |second_letter|
        temp.push letter + second_letter
    end
end
i = 0
first_time = true
sql.each do |line|
    if first_time
        sql_filtered.puts line
        first_time = false
        next
    end
    line_filtered = line.sub /`.+`/, "`#{temp[i]}`"
    sql_filtered.puts line_filtered
    i = i + 1
end
sql.close
sql_filtered.close
