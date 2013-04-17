# encoding: UTF-8

class School
  attr_reader :name

  def self.all
    [
      School.new("Emmen Dorf"),
      School.new("Erlen"),
      School.new("Gersag"),
      School.new("Hübeli"),
      School.new("Krauer"),
      School.new("Meierhöfli"),
      School.new("Riffig"),
      School.new("Rüeggisingen"),
      School.new("Sprengi"),
    ]
  end

  def initialize(name)
    @name = name
  end

end
