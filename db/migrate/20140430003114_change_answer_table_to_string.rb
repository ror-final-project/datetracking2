class ChangeAnswerTableToString < ActiveRecord::Migration
  def change
  	change_column :surveys,  :answer, :string
  end
end
