require 'spec_helper'

describe "UserPages" do
  subject { page } # test condion for
  
  describe "signup_pages" do
    before { visit signup_path }
    
    it { should have_selector('h1', text: "Sign up!") }
    it { should have_selector('title', text: full_title("Sign up"))}
  end
end
