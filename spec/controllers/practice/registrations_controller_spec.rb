require 'spec_helper'
# see http://kakimotonline.com/2014/03/30/extending-devise-registrations-controller/
 
describe Practice::RegistrationsController do
  # render_views
 
  # before(:each) do
  #   @request.env["devise.mapping"] = Devise.mappings[:user]
  # end
 
  # context "create" do
  #   before(:each) do
  #     @user_params = {
  #       email: "usermail@gmail.com",
  #       password: "AbCdEfGh9876",
  #       password_confirmation: "AbCdEfGh9876",
  #       account_attributes: {
  #         name: "my account",
  #       }
  #     }
  #   end
 
  #   it "should create new user" do
  #     assert_difference "User.count" do
  #       post :create, user: @user_params
  #     end
 
  #     user = User.find_by_email(@user_params[:email])
  #     expect(user).not_to be_nil
  #   end
 
  #   it "should create new account" do
  #     assert_difference "Account.count" do
  #       post :create, user: @user_params
  #     end
 
  #     user = User.find_by_email(@user_params[:email])
  #     expect(user.account).not_to be_nil
  #     expect(user.account.name).to eq(@user_params[:account_attributes][:name])
  #   end
 
  #   context "invalid user attributes" do
  #     before(:each) do
  #       @user_params[:email] = ""
  #     end
 
  #     it "should not create user nor account" do
  #       assert_no_difference "User.count" do
  #         assert_no_difference "Account.count" do
  #           post :create, user: @user_params
  #         end
  #       end
  #     end
 
  #     it "should display error messages in the view" do
  #       post :create, user: @user_params
  #       user = assigns(:user)
  #       expect(user.errors[:email]).to_not be_empty
  #       assert_select "div.field_error", html: user.errors[:email].first
  #     end
  #   end
 
  #   context "invalid account attributes" do
  #     before(:each) do
  #       @user_params[:account_attributes][:name] = ""
  #     end
 
  #     it "should not create user nor account" do
  #       assert_no_difference "User.count" do
  #         assert_no_difference "Account.count" do
  #           post :create, user: @user_params
  #         end
  #       end
  #     end
 
  #     it "should display error messages in the view" do
  #       post :create, user: @user_params
  #       user = assigns(:user)
  #       expect(user.errors["account.name"]).to_not be_empty
  #       assert_select "div.field_error", html: user.errors["account.name"].first
  #     end
  #   end
  # end
end