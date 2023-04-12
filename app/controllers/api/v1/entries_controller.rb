class Api::V1::EntriesController < ApplicationController
  before_action :authorize_request
  
  def index
    @entries=Entry.all
    render json: @entries
  end
  
  def show
    @entry=Entry.find(params[:id])
    render json: @entry
  end

  def create
    @entry=Entry.create(name: params[:name], text: params[:text], user_id: params[:user_id])
    render json: @entry
  end

  def update
    @entry=Entry.find(params[:id])
    @entry.update(name: params[:name], text: params[:text], user_id: params[:user_id])
    render json: "#{@entry.name} has been updated!"
  end

  def destroy
    @entry=Entry.find(params[:id])
    @entry.destroy
    render json: "#{@entry.name} has been deleted!"
  end
end
