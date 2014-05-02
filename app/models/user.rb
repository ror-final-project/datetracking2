class User < ActiveRecord::Base

has_many :datees

has_many :surveys
has_many :experiences

attr_accessor :password
before_save :encrypt_password

validates_confirmation_of :password
validates_presence_of :password, :on => :create
validates_presence_of :email
validates_uniqueness_of :email

has_attached_file :photo, :styles => { :small => "150x150>", :medium => "300x300" },
:url => "/system/:attachment/:id/:style/:basename.:extension",
:path => ":rails_root/public/system/:attachment/:id/:style/:basename.:extension"

validates_attachment_content_type :photo, :content_type => ["image/jpg", "image/jpeg", "image/png"]
	def encrypt_password
		if password.present?
			self.password_salt = BCrypt::Engine.generate_salt
			self.password_hash = BCrypt::Engine.hash_secret(password, password_salt)
		end
	end

	def self.authenticate(email, password)
		user = User.where(email: email).first
		if user && user.password_hash == BCrypt::Engine.hash_secret(password, user.password_salt)
			user
		else
			nil
		end
	end
end
