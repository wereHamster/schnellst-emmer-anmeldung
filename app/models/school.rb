class School
  attr_reader :name

  def self.all
    [
      School.new("Emmen"),
      School.new("Huebeli"),
    ]
  end

  def initialize(name)
    @name = name
  end

end
