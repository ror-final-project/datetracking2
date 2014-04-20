class AddAnswerToSurveys < ActiveRecord::Migration
  def change
    add_column :surveys, :answer, :boolean
  end
end
