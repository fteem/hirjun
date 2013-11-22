class CreateJobAds < ActiveRecord::Migration
  def change
    create_table :job_ads do |t|
      t.string :title
      t.text :description
      t.string :company_name
      t.string :company_url
      t.string :location
      t.boolean :remote_work
      t.text :additional_info
      t.text :requirements
      t.text :how_to_apply
      t.date :expires_on

      t.timestamps
    end
  end
end
