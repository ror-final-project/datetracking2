class Survey < ActiveRecord::Base
	

	has_many :users
	has_many :answers
	has_one :experience

	def is_similar?
		current_user_survey = Survey.where(:datee_id => params[:id], :user_id => current_user.id ).first
		datee_survey = Survey.where(:datee_id => current_user.id, :user_id =>  params[:id] ).first
		if datee_survey.answer == current_user_survey.answer

			return true
		end
	end	
end
