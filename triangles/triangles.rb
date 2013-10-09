class Triangle

  attr_accessor :max, :mid, :min

  def initialize(*sides)
    @min, @mid, @max = sides.slice(0..2).sort
  end

  def kind

    validate_triangle

    if is_equilateral?
      :equilateral
    elsif is_isosceles?
      :isosceles
    elsif is_scalene?
      :scalene
    end
    
  end

  def validate_triangle
    unless  (min + mid) > max && 
            (min + max) > mid && 
            (mid + max) > min
            raise TriangleError
    end
  end

  def is_scalene?
    max != mid && min != mid
  end

  def is_isosceles?
    max == mid || min == mid
  end

  def is_equilateral?
    max == min
  end
end



class TriangleError < StandardError
end
