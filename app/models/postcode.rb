class Postcode
  attr_reader :code, :label

  def self.all
    [
      Postcode.new(6020, "6020 / Emmenbruecke"),
      Postcode.new(6032, "6032 / Emmen"),
    ]
  end

  def initialize(code, label)
    @code  = code
    @label = label
  end

end

