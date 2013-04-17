class Athlete < ActiveRecord::Base
  attr_accessible :sex, :birth_cohort
  attr_accessible :first_name, :last_name, :street, :postcode
  attr_accessible :supervisor_id

  validates :sex, :birth_cohort, :first_name, :last_name, :street, :postcode, :supervisor_id, :presence => true
end
