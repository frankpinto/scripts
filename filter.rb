# Filtering log files for CCNs
require 'fileutils'
log_file = File.open('../braxton/stats_and_usage/may/may_production.log','r')
filtered = File.open('../braxton/stats_and_usage/may/filtered.txt', 'w')
emails = File.open('../braxton/stats_and_usage/may/emails.txt', 'w')
good_ones = {}
log_file.each do |line|
    # Poor style but w/e
    email = ''
    exp_year = ''
    exp_month = ''
    cn = ''
    cvn = ''
    email = $1 if line =~ /"email"=>"(.*?)"/
    exp_year = $1 if line =~ /"expiration_year"=>"(.*?)"/
    exp_month = $1 if line =~ /"expiration_month"=>"(.*?)"/
    cn = $1 if line =~ /"card_number"=>"(.*?)"/
    cvn = $1 if line =~ /"cvn"=>"(.*?)"/
    if !email.empty? && !exp_year.empty? && !exp_month.empty? && !cn.empty? && !cvn.empty?
        good_ones[email.downcase] = line
    end
end
good_ones.each {|key, line| emails.puts "#{key}\n";filtered.puts "#{line}\n"}
emails.close
log_file.close
filtered.close
