class DateesController < ApplicationController
	before_filter :login_required, :except => [:index, :show]

	def index
		@user = User.find(params[:user_id])
	end

	def show
		redirect_to user_path(params[:id])
	end

	def new
		@experience = Experience.new
		
	end

	def create
		@user = User.find(current_user)
		@datee = User.find(params[:datee_id])
		@experience = Experience.create(params[:experience])
		if @experience.save
			redirect_to user_datee_path(current_user)
		else
			redirect_to user_path(current_user)
		end
	end

	def update
		@user = User.find(current_user)
		@datee = User.find(params[:id])
		@experience = Experience.create(params[:experience])
		if @experience.update_attributes(params[:experience]) 
			flash[:notice] = 'Date sucessfully accepted!'
			redirect_to user_datees_path(current_user)
		else
			redirect_to user_path(current_user)
		end
	end
	def destroy
		@user = User.find(params[:user_id])
		@datee = User.find(params[:id])
		@experience = Experience.create(params[:experience])
		redirect_to user_datees_path(:user_id => current_user)
	end
end
