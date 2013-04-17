# encoding: UTF-8

class Sex
  attr_reader :short, :long

  def self.all
    [
      Sex.new("K", "Knabe"),
      Sex.new("M", "Mädchen"),
    ]
  end

  def initialize(short, long)
    @short = short
    @long  = long
  end

end
