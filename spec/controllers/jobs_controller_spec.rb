require 'spec_helper'

describe JobsController do
  describe "GET 'index'" do
    it 'loads confirmed jobs ads in descending order' do
      job1 = FactoryGirl.create :job, confirmed: true
      job2 = FactoryGirl.create :job, confirmed: false
      job3 = FactoryGirl.create :job, confirmed: true
      get :index
      expect(response).to be_success
      expect(assigns(:jobs)).to match_array [job1, job3]
    end

    it 'renders jobs/index template' do
      get :index
      expect(response).to render_template :index
    end
  end

  describe "GET 'show'" do
    before :each do
      @job = FactoryGirl.create :job, confirmed: true
    end

    it 'should find and show a job' do
      get :show, id: @job
      expect(response).to be_success
      expect(assigns(:job)).to eq @job
    end

    it 'renders jobs/show template' do
      get :show, id: @job
      expect(response).to render_template :show
    end
  end

  describe "GET 'new'" do
    it 'creates a new Job object' do
      job = double(Job)
      expect(Job).to receive(:new).and_return(job)
      get :new
      expect(response).to be_success
      expect(assigns(:job)).to eq job
    end

    it 'renders jobs/edit temaplte' do
      get :new
      expect(response).to render_template :new
    end
  end

  describe "POST 'create'" do
    context 'valid job' do
      it 'creates a new job' do
        job = FactoryGirl.build :job
        expect{
          post :create, job: job.attributes
        }.to change(Job, :count).by(1)
        expect(response).to be_redirect
      end
    end

    context 'invalid job' do
      it 'does not create a new job' do
        job = FactoryGirl.build(:job, :title => '')
        expect{
          post :create, job: job.attributes
        }.not_to change(Job, :count)
      end
    end
  end

  describe "GET 'edit'" do
    before :each do
      @job = FactoryGirl.create :job
    end

    it 'renders jobs/edit template' do
      get :edit, id: @job
      expect(response).to render_template :edit
    end

    it 'finds a job ad to edit' do
      get :edit, id: @job
      expect(assigns(:job)).to eq @job
    end
  end

  describe "PATCH 'update'" do
    it 'updates an existing job ad and redirects' do
      @job = FactoryGirl.create :job
      @job.title = 'Sample title'

      patch :update, id: @job, job: @job.attributes

      expect(assigns(:job)).to eq @job
      expect(@job.title).to eq "Sample title"
      expect(response).to be_redirect
    end
  end

  describe "DELETE 'destroy'" do
    before :each do
      @job = FactoryGirl.create :job
    end

    it 'deletes a job advert' do
      expect {
        delete :destroy, id: @job
      }.to change(Job, :count).by(-1)
    end

    it 'redirects on success' do
      delete :destroy, id: @job
      expect(response).to be_redirect
    end

  end
end
