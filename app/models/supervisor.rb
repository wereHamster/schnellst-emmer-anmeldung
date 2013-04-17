class Supervisor < ActiveRecord::Base
  attr_accessible :email, :name, :school
  has_many :athletes
end
