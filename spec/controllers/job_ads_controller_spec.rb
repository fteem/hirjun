require 'spec_helper'

describe JobAdsController do
  login_user

  describe "GET 'index'" do
    it 'should load all jobs ads in descending order' do
      job_ad1 = FactoryGirl.create :job_ad
      job_ad2 = FactoryGirl.create :job_ad
      get :index
      expect(response).to be_success
      expect(assigns(:job_ads)).to match_array [job_ad1, job_ad2]
    end

    it 'renders job_ads/index template' do
      get :index
      expect(response).to render_template :index
    end
  end

  describe "GET 'show'" do
    before :each do
      @job_ad = FactoryGirl.create :job_ad
    end

    it 'should find and show a job' do
      get :show, id: @job_ad
      expect(response).to be_success
      expect(assigns(:job_ad)).to eq @job_ad
    end

    it 'renders job_ads/show template' do
      get :show, id: @job_ad
      expect(response).to render_template :show
    end
  end

  describe "GET 'new'" do
    it 'creates a new JobAd object' do
      job_ad = double(JobAd)
      expect(JobAd).to receive(:new).and_return(job_ad)
      get :new
      expect(response).to be_success
      expect(assigns(:job_ad)).to eq job_ad
    end

    it 'renders job_ads/edit temaplte' do
      get :new
      expect(response).to render_template :new
    end
  end

  describe "POST 'create'" do
    context 'valid job_ad' do
      it 'creates a new job_ad' do
        job_ad = FactoryGirl.build :job_ad
        expect{
          post :create, job_ad: job_ad.attributes
        }.to change(JobAd, :count).by(1)
        expect(response).to be_redirect
      end
    end

    context 'invalid job_ad' do
      it 'does not create a new job_ad' do
        job_ad = FactoryGirl.build(:job_ad, :name => '')
        expect{
          post :create, job_ad: job_ad.attributes
        }.not_to change(JobAd, :count)
      end
    end
  end

  describe "GET 'edit'" do
    before :each do
      @job_ad = FactoryGirl.create :job_ad
    end

    it 'renders job_ads/edit template' do
      get :edit, id: @job_ad
      expect(response).to render_template :edit
    end

    it 'finds a job ad to edit' do
      get :edit, id: @job_ad
      expect(assigns(:job_ad)).to eq @job_ad
    end
  end

  describe "PATCH 'update'" do
    it 'updates an existing job ad and redirects' do
      @job_ad = FactoryGirl.create :job_ad
      @job_ad.name = 'Sample name'

      patch :update, id: @job_ad, job_ad: @job_ad.attributes

      expect(assigns(:job_ad)).to eq @job_ad
      expect(@job_ad.name).to eq "Sample name"
      expect(response).to be_redirect
    end
  end

  describe "DELETE 'destroy'" do
    before :each do
      @job_ad = FactoryGirl.create :job_ad
    end

    it 'deletes a job advert' do
      expect {
        delete :destroy, id: @job_ad
      }.to change(JobAd, :count).by(-1)
    end

    it 'redirects on success' do
      delete :destroy, id: @job_ad
      expect(response).to be_redirect
    end

  end
end
