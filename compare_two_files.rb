require 'fileutils'
e1 = File.open('../braxton/stats_and_usage/april/success_emails.txt','r') {|f| f.readlines.collect {|l| l.strip}}
e2 = File.open('../braxton/stats_and_usage/april/sub_emails_from_db.txt','r') {|f| f.readlines.collect {|l| l.strip}}
not_in_e2  = e1.select {|e| !e2.include? e}
not_in_e1  = e2.select {|e| !e1.include? e}
puts "Not in emails.txt: " + not_in_e1.inspect
puts "Not in sub....txt: " + not_in_e2.inspect
