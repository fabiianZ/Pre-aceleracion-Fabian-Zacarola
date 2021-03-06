class User < ApplicationRecord

  include Devise::JWT::RevocationStrategies::JTIMatcher
 
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :jwt_authenticatable, jwt_revocation_strategy: self
         after_create :welcome_send
         def welcome_send 
             WelcomeMailer.welcome_send(self).deliver
         end
end
