require 'spec_helper'

describe "Static pages" do
  
    subject { page }  # to test
    
    shared_examples_for "all static pages" do
        it { should have_selector('h1', text: heading) } 
        it { should have_selector('title', text: full_title(page_title)) }
    end
  # let is the Rspec function that stores argument value in a variable 
#  let(:base_title) {"Ruby on Rails Tutorials Sample App"}
 
  # tests the home page
  describe "Home page" do
    
    before { visit root_path } # path to visit for each condition
    
    let(:heading) {"Sample App"}
    let(:page_title) {''}
    it_should_behave_like "all static pages"
    it { should_not have_selector('title', text: "| Home") }
   
  end
  
  # tests the help page 
  describe "Help page" do
    before { visit help_path } # path to visit for each condition
    
    let(:heading) {"Help"}
    let(:page_title) {"Help"}
    it_should_behave_like "all static pages"
   end
   
   # test the About page
   describe "About page" do
    before { visit about_path } # path to visit for each condition
    let(:heading) {"About Us"}
    let(:page_title) {"About Us"}
    it_should_behave_like "all static pages"
   end
   
   # test the Contact page
   describe "Contact page" do
    before { visit contact_path } # path to visit for each condition
        let(:heading) {"Contact Us"}
        let(:page_title) {"Contact Us"}
        it_should_behave_like "all static pages"      
    end 
    
    # Tests that links goes to where it is intended 
   #  shared_examples_for "Click Links" do
    #        click_link link
     #       page.should have_selector 'title', text: full_title(page_title)
      #  end
    it "should have the right links on the layout" do
        visit root_path
       
        click_link 'About'
        page.should have_selector 'title', text: full_title('About Us')
        
        click_link 'Help'
        page.should have_selector 'title', text: full_title('Help')
        
        click_link 'Contact'
        page.should have_selector 'title', text: full_title('Contact Us')
        
        click_link 'Home'
        page.should have_selector 'title', text: full_title('')
        
        click_link 'Sign up now!'
        page.should have_selector 'title', text: full_title('Sign up')
    end        
end

  


#  describe "GET /static_pages" do
 #   it "works! (now write some real specs)" do
      # Run the generator again with the --webrat flag if you want to use webrat methods/matchers
 #     get static_pages_index_path
  #    response.status.should be(200)

