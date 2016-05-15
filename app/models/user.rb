class User < ActiveRecord::Base
	validates :username, presence: true, 
			  uniqueness: {case_sensitive: false} ,
			  length: {minimum: 3, maximum: 25}

	VALID_EMAIL_REGEX = /\A[^@]+@([^@\.]+\.)+[^@\.]+\z/i
	validates :email, presence: true, 
			  uniqueness: {case_sensitive: false},
			  format: { with: VALID_EMAIL_REGEX},
			  length: {maximum: 110},


end