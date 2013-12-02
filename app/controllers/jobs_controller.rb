class JobsController < ApplicationController
  def index
    @jobs = Job.confirmed.order(created_at: :desc)
  end

  def show
    @job = Job.confirmed.find(params[:id])
  end

  def new
    @job = Job.new
  end

  def create
    @job = Job.new(job_params)
    if @job.save
      flash[:notice] = 'Your job was created. Please check your inbox for the confirmation email!'
      redirect_to root_url
    else
      render :new
    end
  end

  def edit
    @job = Job.find(params[:id])
  end

  def update
    @job = Job.find(params[:id])
    if @job.update_attributes(job_params)
      flash[:notice] = 'Your job ad has been updated!'
      redirect_to @job
    else
      flash[:error] = 'An error occured, please try again'
      render :edit
    end
  end

  def destroy
    @job = Job.find(params[:id])
    if @job.destroy
      flash[:notice] = 'The advertisement has been deleted'
      redirect_to root_url
    else
      flash[:error] = 'An error occured, please try again'
      redirect_to @job
    end
  end

  def confirm
    @job = Job.unconfirmed.find_by_confirmation_token(params[:token])
    if @job.update_attributes({confirmed: true})
      flash[:notice] = "Your job listing has been confirmed. Thank you!"
      redirect_to @job
    else
      flash[:error] = "Your job listing cannot be confirmed, please double check the link and try again!"
      redirect_to root_url
    end
  end

  private
  def job_params
    params.require(:job).permit(:title, :description, :remote_work, :company_name,
                                :company_url, :location, :additional_info, :how_to_apply, :author_email)
  end

end
