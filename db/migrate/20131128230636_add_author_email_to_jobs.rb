class AddAuthorEmailToJobs < ActiveRecord::Migration
  def change
    add_column :jobs, :author_email, :string
  end
end
