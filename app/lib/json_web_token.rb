class JsonWebToken
    SECRET_KEY = "Supersecretkeybase"# Demo only, you should use: Rails.application.secret_key_base.to_s
    
    def self.encode(payload, exp = 24.hours.from_now)
      # set token expiration time 
      payload[:exp] = exp.to_i
      # this encodes the user data(payload) with our secret key
      JWT.encode(payload, SECRET_KEY, 'HS256')
    end

    def self.decode(token)
       #decodes the token to get user data (payload)
      body = JWT.decode(token, SECRET_KEY, 'HS256')[0]
      HashWithIndifferentAccess.new body
      
      # raise custom error to be handled by custom handler
      rescue JWT::ExpiredSignature, JWT::VerificationError => e
          #raise ExceptionHandler::ExpiredSignature, e.message
        rescue JWT::DecodeError, JWT::VerificationError => e
          #raise ExceptionHandler::DecodeError, e.message
    end
end