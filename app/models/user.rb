class User < ApplicationRecord
  has_many :entry
  has_secure_password
  
  def gettoken
    #puts self.id
    #JsonWebToken is defined in lib/json_web_token.rb
    token=JsonWebToken.encode(user_id: self.id)
    token
  end
end
