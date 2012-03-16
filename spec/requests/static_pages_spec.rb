require 'spec_helper'

describe "Static pages" do
  
  # tests the home page
  describe "Home page" do
    it "should have the content 'Sample App'" do
      visit '/static_pages/home'
      page.should have_selector('h1', :text=>"Sample App") 
    end
    
    it "should have title 'Home'" do
      visit '/static_pages/home'
      page.should have_selector('title', 
                    :text =>"Ruby on Rails Tutorial Sample App | Home")
    end
    
  end
  
  # tests the help page 
  describe "Help page" do
    it "should have the content 'Help'" do
      visit '/static_pages/help'
      page.should have_selector('h1', :text =>"Help")
    end
    
    it "should have the title 'Help'" do
      visit '/static_pages/help'
      page.should have_selector('title',
                      :text => "Ruby on Rails Tutorial Sample App | Help")
    end
   end
   
   # test the About page
   describe "About page" do
    it "should have the content 'About Us'" do
     visit '/static_pages/about'
     page.should have_selector('h1', :text=> "About Us")
    end
    
    it "should have title 'About Us'" do
      visit '/static_pages/about'
      page.should have_selector('title',
                        :text => "Ruby on Rails Tutorial Sample App | About Us")
    end
    
   end
end

  


#  describe "GET /static_pages" do
 #   it "works! (now write some real specs)" do
      # Run the generator again with the --webrat flag if you want to use webrat methods/matchers
 #     get static_pages_index_path
  #    response.status.should be(200)

