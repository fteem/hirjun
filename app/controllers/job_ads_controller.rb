class JobAdsController < ApplicationController
  before_filter :authenticate_user!, except: [:index, :show, :new]

  def index
    @job_ads = JobAd.order(created_at: :desc)
  end

  def show
    @job_ad = JobAd.find(params[:id])
  end

  def new
    @job_ad = JobAd.new
  end

  def create
    @job_ad = JobAd.new(job_ad_params)
    if @job_ad.save
      flash[:notice] = 'Your job ad was created!'
      redirect_to @job_ad
    else
      render :new
    end
  end

  def edit
    @job_ad = JobAd.find(params[:id])
  end

  def update
    @job_ad = JobAd.find(params[:id])
    if @job_ad.update_attributes(job_ad_params)
      flash[:notice] = 'Your job ad has been updated!'
      redirect_to @job_ad
    else
      flash[:error] = 'An error occured, please try again'
      render :edit
    end
  end

  def destroy
    @job_ad = JobAd.find(params[:id])
    if @job_ad.destroy
      flash[:notice] = 'The advertisement has been deleted'
      redirect_to root_url
    else
      flash[:error] = 'An error occured, please try again'
      redirect_to @job_ad
    end
  end

  private
  def job_ad_params
    params.require(:job_ad).permit(:title, :description, :remote_work, :expires_on,
                                   :requirements, :company_name, :company_url,
                                   :location, :additional_info, :how_to_apply)
  end

end
