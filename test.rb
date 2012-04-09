def greet
  10.times {puts "hi there"}
end

def maybe cond
  if cond
    puts "true"
  else
    puts "false"
  end
end


cats=['frank','denise','pop']
cats.each do |cat|
  puts cat
end

maybe true
maybe false
greet

require 'net/http'
Net::HTTP.start( 'www.ruby-lang.org', 80 ) do |http|
  print( http.get( '/en/LICENSE.txt' ).body ) 
end

#require 'wordlist'
# Get evil idea and swap in code words
# print "Enter your new idea: " idea = gets
# code_words.each do |real, code|
# idea.gsub!( real, code ) end
# # Save the jibberish to a new file
# print "File encoded. Please enter a name for this idea: " idea_name = gets.strip
# File::open( "idea-" + idea_name + ".txt", "w" ) do |f|
# f << idea end
kitty_toys = [
    {:shape => 'sock', :fabric => 'cashmere'},
      {:shape => 'mouse', :fabric => 'calico'},
        {:shape => 'eggroll', :fabric => 'chenille'}
]

kitty_toys.sort_by { |toy| toy[:shape] }.each do |toy|
  puts "Blixy has a #{ toy[:shape] } made of #{ toy[:fabric] }"
end


