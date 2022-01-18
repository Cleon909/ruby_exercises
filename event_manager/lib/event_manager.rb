require 'csv'
require 'google/apis/civicinfo_v2'
require 'erb'
require 'time'
require 'set'
require 'date'

def clean_zipcode(zipcode)
  zipcode.to_s.rjust(5, '0')[0..4]
end

def legislators_by_zipcode(zip)

  civic_info = Google::Apis::CivicinfoV2::CivicInfoService.new
  civic_info.key = 'AIzaSyClRzDqDh5MsXwnCWi0kOiiBivP6JsSyBw'

  begin
    civic_info.representative_info_by_address(
      address: zip, 
      levels: 'country', 
      roles: ['legislatorUpperBody', 'legislatorLowerBody']
    ).officials
  rescue
    'you can find your representative by visiting www.commoncause.com'
    end
end

def popular_days(cont)
  days = []
  pop_day = {"Mon" => 0, "Tue" => 0, "Wed" => 0, "Thu" => 0, "Fri" => 0, "Sat" => 0, "Sun" => 0,}
  cont.each do |row|
    day = row[:regdate].to_s
    day = Date.strptime(day, "%m/%d/%y")
    days << day.strftime("%a")
  end
  pop_day.each do |key, item|
    pop_day[key] = days.count(key)
  end
end


def save_thank_you_letter(id, form_letter)

  Dir.mkdir('output') unless Dir.exist?('output')

  filename = "output/thanks_#{id}.html"
 
  File.open(filename, 'w') do |file|
   file.puts form_letter
  end
end

def clean_phonenumber(number)
  number.to_s.delete!('^0-9')
    if number.length < 10 then 'No phone number'
    elsif number.length > 11 then 'No phone number'
    elsif number.length == 11 && number[0] == 1 then number.slice[0].insert(5,"-").insert(-5,"-")
    elsif number.length ==11 && number[0] != 1 then 'No phone number'
    else  number.insert(4,"-").insert(-4,"-")
    end
end

def pop_time(cont)
  hours = []
  pop_hours = {}
  cont.each do |row|
    time = row[:regdate].to_s
    time = time.slice!(-5..-1).delete(' ').rjust(5,'0').slice(-5..-4)
    hours << time.to_i
  end
  
  hours_set = hours.to_set
  
  hours_set.each do |item|
    pop_hours[item] = hours.count(item)
  end
end


puts 'Event Manager Initialized!'

contents = CSV.open('../event_attendees.csv', headers: true, header_converters: :symbol)

template_letter = File.read('../form_letter.erb')
erb_template = ERB.new template_letter


contents.each do |row|
  id = row[0]
  name = row[:first_name]

  zipcode = clean_zipcode(row[:zipcode])

  phonenumber = clean_phonenumber(row[:homephone])

  legislators = legislators_by_zipcode(zipcode)

 form_letter = erb_template.result(binding)

 save_thank_you_letter(id,form_letter)
 
end

