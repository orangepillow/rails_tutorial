require 'spec_helper'

describe "Static pages" do
  subject { page }
  describe "Home page" do
    before { visit root_path }
    
    it { should have_content('Sample App') } 
    it { should have_title(full_title('')) }
    it { should_not have_title('| Home') }

    describe "for signed-in users" do
      let(:user) { create(:user) }
      before do
        create(:micropost, user: user, content: "Lorem ipsum")
        create(:micropost, user: user, content: "Dolor sit amet")
        sign_in user
        visit root_path
      end

      it "should render the user's feed" do
        user.feed.each do |item|
          expect(page).to have_selector("li##{item.id}", text: item.content)
        end
      end
    end
  end

  describe "Contact page" do
    before { visit contact_path }

    it { should have_content('Contact') } 
    it { should have_title(full_title('Contact')) }
  end
end
