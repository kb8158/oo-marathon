require_relative "cage"
class ZooAtCapacity < StandardError
end

class Zoo
  attr_reader :cages, :employees, :season_opening_date, :season_closing_date
  def initialize(name, season_opening_date, season_closing_date)
    @name = name
    @season_opening_date = season_opening_date
    @season_closing_date = season_closing_date
    @cages = []
      10.times do
        @cages << Cage.new
    end
    @employees = []
  end

  def add_employee(employee)
    @employees << employee
  end

  def open?(date)
    date > @season_opening_date && date < @season_closing_date
  end

  def add_animal(animal)
    @cages.each do  |cage|
      if cage.empty?
        cage.animal = animal
      return
      end
    end
    raise ZooAtCapacity
  end

  def visit
    string = " "
    @employees.each do |employee|
      string += employee.greet + "\n"
    end

    @cages.each do |cage|
      if cage.animal
        string += cage.animal.speak + "\n"
      end
    end
    return string
  end
  
end
