class Api::V1::UsersController < Api::V1::BaseController
  skip_before_action :verify_authenticity_token
  
  def sign_in
    email = params[:user][:email]
    password = params[:user][:password]
    @user = User.find_by_email(email)

    if @user && @user.valid_password?(password)
      render status: 200, json: {success: true, response: { message: "Sign in Successfully!"}}
    else
      render status: 400, json: {success: false, response: { message: "Invalid username or password"}}
    end 
  end

end