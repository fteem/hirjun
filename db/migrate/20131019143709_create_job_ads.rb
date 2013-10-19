class CreateJobAds < ActiveRecord::Migration
  def change
    create_table :job_ads do |t|
      t.string :name
      t.text :description
      t.string :company
      t.string :city
      t.string :country


      t.timestamps
    end
  end
end
