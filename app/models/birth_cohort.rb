class BirthCohort
  attr_reader :year

  def self.all
    [
      BirthCohort.new(1999),
    ]
  end

  def initialize(year)
    @year = year
  end

end

