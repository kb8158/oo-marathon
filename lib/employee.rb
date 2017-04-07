class Employee
  attr_reader :name, :title
  def initialize(name, title = nil)
    @name = name
    @title = title || "Zoo Keeper"
  end

  def full_title
    "#{@name}, #{@title}"
  end

  def greet
    "#{@name} waved hello!"
  end
end
