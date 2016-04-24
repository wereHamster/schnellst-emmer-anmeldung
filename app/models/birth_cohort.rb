class BirthCohort
  attr_reader :year

  def self.all
    (2003 .. 2009).map do |year|
      BirthCohort.new(year)
    end
  end

  def initialize(year)
    @year = year
  end

end
