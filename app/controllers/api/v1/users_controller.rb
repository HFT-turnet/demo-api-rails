class Api::V1::UsersController < ApplicationController
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
