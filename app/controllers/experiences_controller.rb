class ExperiencesController < ApplicationController
  def index
    @experiences = Experience.where("user_id = ? OR datee_id = ?", current_user.id, current_user.id)
     
    @users = User.all


    @users = []
    @experiences.each do |experience|
      user = experience.user_id == current_user.id ? experience.datee : experience.user 
      
    
      @users.push user
    end
    @users.uniq!
    #debugger
  end

  def show
    @experience = Experience.find(params[:id])
  end

  def new
    @experience = Experience.new
  end

  def create
    
    @experience = Experience.new(experience_params)
    @user = User.where(id: params[:user_id].to_i).first
    
    if @user
      @experience.datee_id = @user.id
      @experience.fname = @user.fname
      @experience.user_id = current_user.id
      
      if @experience.date == nil
        @experience.date = Date.current
        
      end  
      #if a user is found, assign them to that experience, flash notice
      #to inform of success,
      #redirect.
      #@experience.user = current_user
      if @experience.save
        current_user.increment!(:number_of_experiences)
        flash[:notice] = "Your date has been saved."
        redirect_to experiences_path(@experience)
      else
        flash[:alert] = "Your date was unable to be saved."
        redirect_to :back
      end
    else
      flash[:alert] = "Sorry, there was no user found with that email."
      #redirect
    end 
  end

  def edit
    @experience = Experience.find(params[:id])

  end

  def update
    @experience = Experience.find(params[:id])
    if @experience && @experience.update_attributes(experience_params)
      flash[:notice] = "You experience has been updated!"
    else
      flash[:alert] = "There was an issue updating your experience."
    end
    redirect_to experience_path(@experience)
  end

  def destroy
    @experience = Experience.find(params[:id])
    if @experience.destroy
      flash[:notice] = "You date has been destroyed!"
      redirect_to "/experiences"
    else
      flash[:alert] = "There was an issue updating your date."
      redirect_to :back
    end
  end

  private

  def experience_params
    params.require(:experience).permit(:user_id, :fname, :date, :location, :description)
  end
end
