class User < ActiveRecord::Base

has_many :datees, :through => :relationships, :conditions => "status = 'accepted'"
has_many :requested_datees, :through => :relationships, :source => :datee, :conditions => "status = 'requested'", :order => :created_at
has_many :pending_datees, :through => :relationships, :source => :datee, :conditions => "status = 'pending'", :order => :created_at
has_many :relationships, :dependent => :destroy

has_many :surveys
has_many :experiences

attr_accessor :password
before_save :encrypt_password

validates_confirmation_of :password
validates_presence_of :password, :on => :create
validates_presence_of :email
validates_uniqueness_of :email

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
