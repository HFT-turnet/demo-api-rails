class ApplicationController < ActionController::API
  
  def authorize_request
      header = request.headers['Authorization']
      header = header.split(' ').last if header
      begin
        @decoded = JsonWebToken.decode(header)
        @user = User.find(@decoded[:user_id]) unless @decoded.nil? 
        render json: { errors: "You need to supply a bearer token." }, status: :unauthorized if @decoded.nil? 
      rescue ActiveRecord::RecordNotFound => e
        render json: { errors: e.message }, status: :unauthorized
      rescue JWT::DecodeError => e
        render json: { errors: e.message }, status: :unauthorized
      end
    end
    
end
