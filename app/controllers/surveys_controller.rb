class SurveysController < ApplicationController
   def index
		@user = User.find(params[:experience_id])
	end


	def show
		@survey = Survey.where(:datee_id => params[:id], :user_id => current_user.id ).first
		@experiences = Experience.where(:datee_id => params[:id], :user_id => current_user.id)
	end

	def new
		@survey = Survey.new
		@experience = Experience.find(params[:experience_id])

	end

	def create
		@survey = Survey.new(survey_params)
		#@survey.datee_id = params[:datee_id]
		@survey.user_id = current_user.id
		#debugger
		#@survey.answer = params[:answer].to_i
		if  @survey.save
		  if  is_similar?(@survey.user_id, @survey.datee_id)
			#email_method(@survey.answer)
		  end
			#flash[:notice] = "Your questionnaire has been saved."
			redirect_to experiences_path(@surveys)
		else
			@survey = Survey.where(params[:answer]).blank?
			flash[:alert] = "Your questionnaire was unable to be saved."
			redirect_to experiences_path(@surveys)
		end
	end

	private

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

	def survey_params
		params.permit(:answer, :user_id, :datee_id) 
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
