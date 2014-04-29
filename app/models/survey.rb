class Survey < ActiveRecord::Base
	validates_presence_of :answer

	has_many :users
	has_many :answers
	has_one :experience
end
