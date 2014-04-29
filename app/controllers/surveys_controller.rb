class SurveysController < ApplicationController
   def index
		@user = User.find(params[:experience_id])
	end


	def show
		@survey = Survey.find(params[:datee_id])
	end

	def new
		@survey = Survey.new
		@experience = Experience.find(params[:experience_id])

	end

	def create
		@survey = Survey.new(survey_params)
		@survey.datee_id = params[:datee_id]
		@survey.user_id = current_user
		@survey = Survey.new(survey_params)
		if  @survey.save!
			flash[:notice] = "Your questionnaire has been saved."
			redirect_to experiences_path(@surveys)
		else
			@survey = Survey.where(survey_params).blank?
			flash[:alert] = "Your questionnaire was unable to be saved."
			redirect_to experiences_path(@surveys)
		end
	end

	private

	def survey_params
		params.require(:survey).permit(:answer1, :answer2, :user_id, :datee_id) if params[:survey]
	end

	## do not want to give others ability to edit/delete orig survey
	#def edit
	#	@survey = Survey.find(params[:id])

	#end

	#def update
	#	@survey = Survey.find(params[:id])
	#	if @survey && @survey.update_attributes(params[:survey])
	#		flash[:notice] = "You questionnaire has been updated!"
	#	else
	#		flash[:alert] = "There was an issue updating your questionnaire."
	#	end
	#	redirect_to user_survey_path(@survey.user, @survey)
	#end

	#def destroy
	#	@survey = Survey.find(params[:id])
	#	if @survey.destroy
	#		flash[:notice] = "You questionnaire has been deleted!"
	#		redirect_to user_survey_path(@survey.user)
	#	else
	#		flash[:alert] = "There was an issue deleting your questonnaire."
	#		redirect_to :back
	#	end
	#end
end
