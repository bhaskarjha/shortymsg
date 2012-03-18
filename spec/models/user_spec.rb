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

require 'spec_helper'

describe User do
  
    before { @user = User.new(name: "Example User", 
                    email: "example@example.com") }  
  
  subject { @user }
  
  it { should respond_to(:name) }
  it { should respond_to(:email) }
  it { should respond_to(:password_digest) }
  
  it { should be_valid }
 
  describe "When name and email is not present" do
  
     before { @user.name = " ", @user.email = " " }
     it { should_not be_valid }
  end
  
  describe "When length of name field is maximum 50 characters" do
    before { @user.name = 'a' * 51 }
    it { should_not be_valid }
   end
   
   describe "When email format should be valid" do
        valid_addresses = %w[user@foo.com A_USER@FOO.COM B-User@fo.ob.ar frst.last@firm.co.jp a+b@choo.tia.cn]
        valid_addresses.each do |valid_address|
            before { @user.email = valid_address }
            it { should be_valid}
         end
   end
   
   describe "When email address is already taken" do
        before do
            user_with_same_email = @user.dup
            user_with_same_email.email = @user.email.upcase
            user_with_same_email.save
        end
        
        it {should_not be_valid }
   end
     
  #pending "add some examples to (or delete) #{__FILE__}"
end
