class AddConfirmedFlagToJobs < ActiveRecord::Migration
  def change
    add_column :jobs, :confirmed, :boolean, default: false
  end
end
