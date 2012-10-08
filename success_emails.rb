require 'fileutils'

emails = File.open('../braxton/stats_and_usage/may/recurring_debug.txt', 'r') {|f| f.readlines.collect {|l| l.strip}}
success_emails = File.open('../braxton/stats_and_usage/may/success_emails.txt', 'w')

emails.each do |line|
    if line =~ /subscribed/ && line[0,1] != '#'
        success_emails.puts line
    end
end
