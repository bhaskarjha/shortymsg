require 'spec_helper'

describe "Static pages" do
  
  # let is the Rspec function that stores argument value in a variable 
  let(:base_title) {"Ruby on Rails Tutorials Sample App"}
 
  # tests the home page
  describe "Home page" do
    it "should have the content 'Sample App'" do
      visit '/static_pages/home'
      page.should have_selector('h1', :text=>"Sample App") 
    end
    
    it "should have base title" do
      visit '/static_pages/home'
      page.should have_selector('title', 
                    :text => "#{base_title}")
    end
    
    it "should not have title Home" do
        visit '/static_pages/home'
        page.should_not have_selector('title', :text => "| Home")
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
                      :text => "#{base_title} | Help")
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
                        :text => "#{base_title} | About Us")
    end
   end
   
   # test the Contact page
   describe "Contact page" do
        it "should have the content 'Contact Us'" do
            visit '/static_pages/contact'
            page.should have_selector('h1', :text=> "Contact Us")
        end
        
        it "should have title 'Contact Us'" do
            visit '/static_pages/contact'
            page.should have_selector('title', 
                            :text => "#{base_title} | Contact Us")
        end
   end 
end

  


#  describe "GET /static_pages" do
 #   it "works! (now write some real specs)" do
      # Run the generator again with the --webrat flag if you want to use webrat methods/matchers
 #     get static_pages_index_path
  #    response.status.should be(200)

