class ChangeAnswerColumnSurveysToInteger < ActiveRecord::Migration
  def change
  	change_column :surveys,  :answer, :integer
  end
end
