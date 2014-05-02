class Survey < ActiveRecord::Base
	

	has_many :users
	has_many :answers
	has_one :experience

	def is_similar?(current, datee)
		current_user_survey = Survey.where(:datee_id => datee, :user_id => current ).first
		 datee_survey = Survey.where(:datee_id => current, :user_id =>  datee ).first
		 #debugger
		if datee_survey && current_user_survey
			if datee_survey.answer == current_user_survey.answer

				return true
			end 
		end
	end	
end
