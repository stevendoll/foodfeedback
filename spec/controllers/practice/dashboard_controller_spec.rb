require 'rails_helper'

RSpec.describe Practice::DashboardController, :type => :controller do

  describe "GET index" do
    let(:practitioner) { FactoryGirl.create(:user, :practitioner) } 
    let(:client) { FactoryGirl.create(:user, :client) } 

    context "unauthenticated user" do
      it "cannot access practitioner dashboard" do
        get :index 
        expect(response).to redirect_to(new_user_session_path)
        expect(flash[:alert]).to have_content 'You need to sign in or sign up before continuing.'
      end

      it "returns http redirect to login page" do
        get :index
        expect(response).to have_http_status('302')
      end
    end

    context "clients" do
      before do
        sign_in(client)
      end
      
      it "cannot access practitioner dashboard" do
        get :index 
        expect(response).to redirect_to(root_path)
        expect(flash[:alert]).to have_content 'Access denied.'
      end

      it "returns http unauthorized" do
        get :index
        expect(response).to have_http_status('302')
      end
    end

    context "practitioners" do
      before do
        sign_in(practitioner)
      end
      
      # it "can access the practitioner dashboard" do
      #   get :index 
      #   expect(response.body).to have_content 'Dashboard'
      # end

      it "returns http success" do
        get :index
        expect(response).to have_http_status(:success)
      end
    end
  end

end