class CreateRelationships < ActiveRecord::Migration
  def self.up
    create_table :relationships do |t|
    	t.integer :user_id, :datee_id
    	t.string :status
     	t.timestamps
    end
  end

  def self.down
  	drop_table :relationships
  end
end
