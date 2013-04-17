class Sex
  attr_reader :short, :long

  def self.all
    [
      Sex.new("K", "Knabe"),
      Sex.new("M", "Maedchen"),
    ]
  end

  def initialize(short, long)
    @short = short
    @long  = long
  end

end
