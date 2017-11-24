require 'httparty'
class User < ActiveRecord::Base
	VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
	VALID_CI_REGEX = /[V,v|E,e]{1}+[0-9]/

	  include HTTParty

  	  has_secure_password
	  validates :correo, uniqueness: {case_sensitive: false ,message: "Este correo ya fue registrado"}, format: { with: VALID_EMAIL_REGEX }
	  attr_accessor :remember_token, :activation_token, :reset_token
  	  before_save   :downcase_correo
  	  before_create :create_activation_digest
  	  validates :nombre,  presence: true, length: { maximum: 50 }
  	  #validates :cedula, presence: true, format: { with: VALID_CI_REGEX }

  	    # Returns true if the given token matches the digest.
	  def authenticated?(attribute, token)
	    digest = send("#{attribute}_digest")
	    return false if digest.nil?
	    BCrypt::Password.new(digest).is_password?(token)
	  end
=begin
		  # Activates an account.
	  def activate
	    update_attribute(:activated,    true)
	    update_attribute(:activated_at, Time.zone.now)
	  end
=end

	  def User.digest(string)
	    cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
	                                                  BCrypt::Engine.cost
	    BCrypt::Password.create(string, cost: cost)
  	  end


	  # Returns a random token.
	  def User.new_token
	    SecureRandom.urlsafe_base64
	  end

	  # Remembers a user in the database for use in persistent sessions.
	  def remember
	    self.remember_token = User.new_token
	    update_attribute(:remember_digest, User.digest(remember_token))
	  end

	  	
		# Activates an account.
  	  def activate
	    update_attribute(:activated,    true)
	    update_attribute(:activated_at, Time.zone.now)
      end

	  # Sends activation email.
	  def send_activation_correo
	    UserMailer.account_activation(self).deliver_now
	  end

		  # Sets the password reset attributes.
	  def create_reset_digest
	    self.reset_token = User.new_token
	    update_attribute(:reset_digest,  User.digest(reset_token))
	    update_attribute(:reset_sent_at, Time.zone.now)
	  end

	  # Sends password reset email.
	  def send_password_reset_correo
	    UserMailer.password_reset(self).deliver_now
	  end

	  # Sends mensaje.
	  def enviar_mensaje
	    UserMailer.enviar_mensaje(self).deliver_now
	  end

		   # Returns true if a password reset has expired.
	  def password_reset_expired?
	    reset_sent_at < 2.hours.ago
	  end


  	  private

    # Converts email to all lower-case.
    def downcase_correo
      self.correo = correo.downcase
    end

    # Creates and assigns the activation token and digest.
    def create_activation_digest
      self.activation_token  = User.new_token
      self.activation_digest = User.digest(activation_token)
    end


    def self.servidor

    	@json = get("http://192.168.43.52:3000/profesors.json")
    	@json = @json.to_json
    	@parsed_json = ActiveSupport::JSON.decode(@json)


    	return @parsed_json

    end

end