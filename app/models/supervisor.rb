class Supervisor < ActiveRecord::Base
  attr_accessible :email, :name, :school
  has_many :athletes

  validates :email, :name, :school, :presence => true
  validates :email, :uniqueness => true
end
