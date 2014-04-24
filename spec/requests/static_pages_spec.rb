require 'spec_helper'

describe "Static pages" do
  subject { page }
  describe "Home page" do
    before { visit root_path }
    
    it { should have_content('Sample App') } 
    it { should have_title('Ruby on Rails Tutorial Sample App') }
    it { should_not have_title('| Home') }
  end

  describe "Contact page" do
    before { visit contact_path }

    it { should have_content('Contact') } 
    it { should have_title('Ruby on Rails Tutorial Sample App | Contact') }
  end
end
