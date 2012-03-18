# == Schema Information
#
# Table name: users
#
#  id         :integer         not null, primary key
#  name       :string(255)
#  email      :string(255)
#  created_at :datetime        not null
#  updated_at :datetime        not null
#

class User < ActiveRecord::Base
    attr_accessible :name, :email, :password_digest
    
    # validation rules
    validates :name, presence: true, length: { maximum: 50 }
    EMAIL_REGEX_EXPRESSION = /\A[\w+\-_]+[\.]?[\w+]+@[a-zA-Z\d\-.]+\.[a-zA_Z]+{2,}\z/i
    validates :email, presence: true, format: { with: EMAIL_REGEX_EXPRESSION },
                      uniqueness: { case_sensitive: false }
end
