class Node
  attr_reader :rating, :title

  def initialize(rating, title)
    @rating = rating
    @title = title

    @left = nil
    @right = nil
  end

  def insert(new_rating, new_title)
    if new_rating < rating
      if @left.nil?
        @left = Node.new(new_rating, new_title)
      else
        @left.insert(new_rating, new_title)
      end
    elsif new_rating > rating
      if @right.nil?
        @right = Node.new(new_rating, new_title)
      else
        @right.insert(new_rating, new_title)
      end
    end
  end

  def include?(rating_query)
    if rating_query == rating
      true
    elsif rating_query < rating
      if @left.nil?
        false
      else
        @left.include?(rating_query)
      end
    elsif rating_query > rating
      if @right.nil?
        false
      else
        @right.include?(rating_query)
      end
    end
  end
end
