require 'rails_helper'

RSpec.feature "UserSettings", type: :feature do
  describe 'User settings' do
    before :each do
      @user = create(:user)
      sign_in(@user)
      sleep 1
      visit edit_user_registration_path
    end

    it 'should allow user to edit their personal information' do
      visit "/member/#{@user.id}"
      sleep 2
      expect(page).to have_text(@user.name)
      expect(page).to have_text(@user.address)
      expect(page).to have_text(@user.profile_title)
      expect(page).to have_text('About')
      expect(page).to have_text(@user.about)
      find(:xpath, '//a[contains(@class, "edit-profile")]//i[contains(@class, "bi-pencil-fill")]').click
      sleep 5
      expect(page).to have_text('Edit your personal details')
      fill_in 'user_first_name', with: 'John'
      fill_in 'user_last_name', with: 'Doe'
      fill_in 'user_city', with: 'New York'
      fill_in 'user_state', with: 'New York'
      fill_in 'user_country', with: 'USA'
      fill_in 'user_pincode', with: '10001'
      fill_in 'user_profile_title', with: 'Advanced Software Developer'
      sleep 2
      click_button 'Save changes'
      expect(page).to have_current_path("/member/#{@user.id}")
      expect(page).to have_text('John Doe')
      expect(page).to have_text('Advanced Software Developer')
      expect(page).to have_text('New York, New York, USA, 10001')
      sleep 5
    end
  end
end
