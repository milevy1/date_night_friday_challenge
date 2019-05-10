class BinarySearchTree
  def initialize
    @head = nil
  end

  def insert(new_rating, new_title)
    if @head.nil?
      @head = Node.new(new_rating, new_title)
    else
      @head.insert(new_rating, new_title)
    end
  end

  def include?(rating_query)
    if @head.nil?
      false
    elsif @head.rating == rating_query
      true
    else
      @head.include?(rating_query)
    end
  end

  def depth_of(rating_query)
    if @head.nil?
      nil
    elsif @head.rating == rating_query
      0
    else
      @head.depth_of(rating_query, -1)
    end
  end

  def max
    if @head.nil?
      nil
    else
      @head.max
    end
  end

  def min
    if @head.nil?
      nil
    else
      @head.min
    end
  end

  def sort
    if @head.nil?
      nil
    else
      @head.sort
    end
  end
end
