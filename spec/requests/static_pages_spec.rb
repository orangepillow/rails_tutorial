require 'spec_helper'

describe "Static pages" do
  describe "Home page" do
    it "should have the content 'Sample App'" do
      visit '/static_pages/home'
      expect(page).to have_content('Sample App')
    end
  end

  describe "Help page" do
    it "should have the base title" do
      visit '/static_pages/home'
      expect(page).to have_title('Ruby on Rails Tutorial Sample App')
    end
  end

  describe "About page" do
    it "should not have a custom base title" do
      visit '/static_pages/home'
      expect(page).not_to have_title('| Home')
    end
  end
end
