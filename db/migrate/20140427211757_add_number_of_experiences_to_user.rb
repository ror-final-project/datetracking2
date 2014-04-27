class AddNumberOfExperiencesToUser < ActiveRecord::Migration
  def change
  	add_column :users, :number_of_experiences, :integer
  end
end
