#####################
# Original Solution #
#####################

# class Person

#   attr_accessor :name, :birthday, :hair_color, :eye_color, :height, :weight, :handed,
#                 :complexion, :t_shirt_size, :wrist_size, :glove_size, :pant_length, 
#                 :pant_width

#   def initialize(data)
#     data.each do |key, value|
#       if Person.method_defined? "#{key}="
#         self.send("#{key}=", value) 
#       end
#     end if data.is_a? Hash
#   end

# end

################################
# Expanding on James' Solution #
################################

class Person
  def initialize(attributes)
    attributes.each do |key, value|
      self.instance_variable_set("@#{key}", value)
    end
  end

  def method_missing(id, *args)
    instance_var = "@#{id}".to_sym
    binding.pry
    raise NoMethodError unless instance_variables.include?(instance_var)
    instance_variable_get(instance_var)
  end
end
