class Api::V1::UsersController < ApplicationController
  before_action :authorize_request, except: :login_token
  
  def login_token
    token=""
    userid=""
    #bkr=1000
    #bkrid=1
    message="Must access function with POST request. Provide login and password."
    if request.post?
      login=User.where(:login => params[:login],:password => params[:password]).first
      if login.nil?
        message="User not found or wrong password." 
        render json: {
                message: message
              }
      end
      if login
        message="Login successful"      
        render json: {
                access_token: login.gettoken,
                userid: login.id,
                login: login.login,
                message: message
              }
      end
    end
  end
  
  def getapps
    # No function, just serving the App template
    text = File.read("app/views/apps.json")
    render json: text
  end
  
  def getsettings
    # No function, just serving the Settings template
    text = File.read("app/views/settings.json")
    render json: text
  end
  
  def index
    @users=User.all
    render json: @users
  end
  
  def show
    @user=User.find(params[:id])
    render json: @user
  end

  def create
    @user=User.create(login: params[:login], name: params[:name], email: params[:email], password: params[:password])
    render json: @user
  end

  def update
    @user=User.find(params[:id])
    @user.update(login: params[:login], name: params[:name], email: params[:email], password: params[:password])
    render json: "#{@user.login} has been updated!"
  end

  def destroy
    @user=User.find(params[:id])
    @user.destroy
    render json: "#{@user.login} has been deleted!"
  end
end
