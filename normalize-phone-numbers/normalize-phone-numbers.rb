# Author: Manuel Neuhauser
# Date :  9/27/2013
# Email:  manuel.neuhauser@flatironschool.com

# Download this file:
# https://gist.github.com/scottcreynolds/ac1b5c8d96de0c91bf7c/download

# Run it from your terminal with: 
# ruby ruby_phone_format.rb
# (Just make sure you are in the right directory)

# ======================================
# Ignore All This Code
# ======================================

@tests = 0

def test(title, &b)
  @tests += 1
  begin
    if b
      result = b.call
      if result.is_a?(Array)
        puts "#{@tests}. fail: #{title}"
        puts "      expected #{result.first} to equal #{result.last}"
      elsif result
        puts "#{@tests}. pass: #{title}"
      else
        puts "#{@tests}. fail: #{title}"
      end
    else
      puts "#{@tests}. pending: #{title}"
    end
  rescue => e
    puts "fail: #{title}"
    puts e
  end
end

def assert(statement)
  !!statement
end

def assert_equal(actual, expected)
  if expected == actual
    true
  else
    [expected, actual]
  end
end

class Object
  def __
    puts "__ should be replaced with a value or expression to make the test pass."
    false
  end
end

# ======================================
# Start Here - Make these tests pass.
# ======================================

# Define a method named normalize_phone_number that takes one
# string argument and returns a string in the format
# (XXX) XXX-XXXX if possible, and just returns the input string if not

# Method definition goes here:

def normalize_phone_number(number)
  clean_number = number.gsub(/[^0-9]/,"")
  return number if clean_number.length != 10
  "(#{clean_number[0,3]}) #{clean_number[3,3]}-#{clean_number[6,4]}"
end

# 1. 
test 'that "1234567890" gets formatted' do 
  
  assert_equal normalize_phone_number("1234567890"), "(123) 456-7890"
end

# 2. 
test 'that "(123)4567890" gets formatted' do 
  
  assert_equal normalize_phone_number("(123)4567890"), "(123) 456-7890"
end

# 3. 
test 'that "123 456 7890" gets formatted' do 
  
  assert_equal normalize_phone_number("123 456 7890"), "(123) 456-7890"
end

# 4. 
test 'that "123-4567890" gets formatted' do 
  
  assert_equal normalize_phone_number("123-4567890"), "(123) 456-7890"
end

# 5. 
test 'that "123-456-7890" gets formatted' do 
  
  assert_equal normalize_phone_number("123-456-7890"), "(123) 456-7890"
end

# 6. 
test 'that "123ABF90" does not get formatted' do 
  
  assert_equal normalize_phone_number("123ABF90"), "123ABF90"
end