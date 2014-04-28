class Experience < ActiveRecord::Base
	belongs_to :user
	has_one :survey

	#has_one :datee, through: :user
	belongs_to :datee, :class_name => 'User', :foreign_key => 'datee_id'

	
end
