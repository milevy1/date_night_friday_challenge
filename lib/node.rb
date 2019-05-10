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

  def depth_of(rating_query, depth_counter)
    depth_counter += 1
    if rating_query == rating
      depth_counter
    elsif rating_query < rating
      if @left.nil?
        nil
      else
        @left.depth_of(rating_query, depth_counter)
      end
    elsif rating_query > rating
      if @right.nil?
        nil
      else
        @right.depth_of(rating_query, depth_counter)
      end
    end
  end

  def max
    if @right.nil?
      { title => rating }
    else
      @right.max
    end
  end

  def min
    if @left.nil?
      { title => rating }
    else
      @left.min
    end
  end

  def sort(sorted_array = [])
    if @left.nil?
     left = []
    else
       left = @left.sort
    end

    if @right.nil?
     right = []
    else
     right = @right.sort
    end

    return left + [ { title => rating } ] + right
  end

  def rating_at(tree_depth)
    if tree_depth == 0
      rating
    elsif @left.nil? && @right.nil?
      nil
    elsif @left.nil?
      @right.rating_at(tree_depth - 1)
    elsif @right.nil?
      @left.rating_at(tree_depth - 1)
    else
      [ @left.rating_at(tree_depth - 1),
        @right.rating_at(tree_depth - 1)
      ]
    end
  end
end
