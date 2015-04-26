class BirthCohort
  attr_reader :year

  def self.all
    (2002 .. 2008).map do |year|
      BirthCohort.new(year)
    end
  end

  def initialize(year)
    @year = year
  end

end
