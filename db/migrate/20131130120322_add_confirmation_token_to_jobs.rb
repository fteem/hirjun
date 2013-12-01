class AddConfirmationTokenToJobs < ActiveRecord::Migration
  def change
    add_column :jobs, :confirmation_token, :string
  end
end
