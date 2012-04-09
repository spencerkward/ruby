# My comment
class MyClass
  attr_accessor :my_attribute

  def my_parameterless_method
    3.times {|n| puts "The number is #{n}"}
    4.times do |n|
      puts "Another syntax #{n}"
    end
  end


  def my_method my_param
    return 0 if my_param == 5
  end

  def string_manipulation
    return my_string.split
  end
end

class MyException < Exception; end

my_obj = MyClass.new
puts my_obj.my_method 3
puts my_obj.my_method 5
my_obj.my_parameterless_method
puts my_obj.instance_of? MyClass.class
