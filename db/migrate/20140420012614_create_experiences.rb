class CreateExperiences < ActiveRecord::Migration
  def change
    create_table :experiences do |t|
      t.integer :user_id
      t.integer :datee_id
      t.integer :friendly_id
      t.integer :post_exp_id
      t.integer :recent_exp_od
      t.integer :upcoming_exp_id
      t.datetime :date
      t.string :location
      t.text :description

      t.timestamps
    end
  end
end
