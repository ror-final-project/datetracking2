class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :fname
      t.string :lname
      t.string :email
      t.string :password_hash
      t.string :password_salt
      t.string :photo_file_name
      t.string :photo_content_type
      t.string :photo_file_size
      t.timestamps
    end
  end
end
