class ChangeAnswerTable < ActiveRecord::Migration
  def change
  	remove_column :surveys,  :answer
  	rename_column :surveys, :answer_id, :answer
  end
end
