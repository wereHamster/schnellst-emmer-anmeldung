class CreateAthletes < ActiveRecord::Migration
  def change
    create_table :athletes do |t|
      t.string :sex
      t.integer :birth_cohort
      t.string :first_name
      t.string :last_name
      t.string :street
      t.string :postcode
      t.integer :supervisor_id
    end
  end
end
