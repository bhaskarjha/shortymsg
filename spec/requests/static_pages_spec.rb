require 'spec_helper'

describe "Static pages" do
  
    subject { page }  # to test
    
  # let is the Rspec function that stores argument value in a variable 
#  let(:base_title) {"Ruby on Rails Tutorials Sample App"}
 
  # tests the home page
  describe "Home page" do
    
    before { visit root_path } # path to visit for each condition
    
    it { should have_selector('h1', :text=>"Sample App") } 
    it { should have_selector('title', :text => full_title('')) }
    it { should_not have_selector('title', :text => "| Home") }
   
  end
  
  # tests the help page 
  describe "Help page" do
    before { visit help_path } # path to visit for each condition
    
    it { should have_selector('h1', :text =>"Help") }
    it { should have_selector('title', :text => full_title('Help')) }
   
   end
   
   # test the About page
   describe "About page" do
    before { visit about_path } # path to visit for each condition
    
    it { should have_selector('h1', :text=> "About Us") } 
    it { should have_selector('title', :text => full_title('About Us')) }
   end
   
   # test the Contact page
   describe "Contact page" do
    before { visit contact_path } # path to visit for each condition
        
        it { should have_selector('h1', :text=> "Contact Us") }
        it { should have_selector('title', :text => full_title('Contact Us')) }
    end 
end

  


#  describe "GET /static_pages" do
 #   it "works! (now write some real specs)" do
      # Run the generator again with the --webrat flag if you want to use webrat methods/matchers
 #     get static_pages_index_path
  #    response.status.should be(200)

