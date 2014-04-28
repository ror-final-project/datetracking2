class AddAnswerToSurveys < ActiveRecord::Migration
  def change
    add_column :surveys, :answer, :integer
  end
end
