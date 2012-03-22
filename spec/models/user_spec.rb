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
                    email: "example@example.com",
                    password: "foobar",
                    password_confirmation: "foobar") }  
  
  subject { @user }
  
  it { should respond_to(:name) }
  it { should respond_to(:email) }
  it { should respond_to(:password_digest) }
  it { should respond_to(:password) }
  it { should respond_to(:password_confirmation) }
  it { should respond_to(:authenticate) }
      
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
   
   describe "when passworf is not present" do
        before { @user.password = @user.password_confirmation = " "}
        
        it { should_not be_valid}
   end  
   
   describe "when password doesn't match" do
        before { @user.password_confimation = "mismatch"}
        
        it { should_not be_valid }
   end
   
   describe "when password confirmation is nil" do
        before { @user.password_confirmation = nil }

        it { should_not be_valid }
   end
   
   describe "with a password that's too short" do
        before { @user.password = @user.password_confirmation = 'a' * 5 }
    
        it { should_not be_valid }
   end
   
   describe "return value of authenticated method" do
        before { @user.save }
        let(:found_user) {User.find_by_email(@user.email) }
        
        describe "with valid password" do
            it { should == found_user.authenticate(@user.password)}
        end
        
        describe "with invalid password" do
            let(:user_for_invalid_password) { found_user.authenticate("invalid") }
            
            it { should_not == user_for_invalid_password }
            specify {user_for_invalid_password.should be_false }
        end
   end
   
  #pending "add some examples to (or delete) #{__FILE__}"
end
