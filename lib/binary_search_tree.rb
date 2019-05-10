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
end
