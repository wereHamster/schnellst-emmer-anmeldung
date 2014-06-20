require 'csv'

class Athlete < ActiveRecord::Base
  attr_accessible :sex, :birth_cohort
  attr_accessible :first_name, :last_name, :street, :postcode
  attr_accessible :supervisor_id

  validates :sex, :birth_cohort, :first_name, :last_name, :street, :postcode, :supervisor_id, :presence => true

  def self.to_csv(options = {})
    CSV.generate(options) do |csv|
      csv << column_names + ['lehrperson', 'school']
      all.each do |athlete|
        sup = Supervisor.find_by_id(athlete.supervisor_id)
        csv << athlete.attributes.values_at(*column_names) + [sup ? sup.name : '', sup ? sup.school : '']
      end
    end
  end
end
