require 'rails_helper'

RSpec.feature "Users", type: :feature do
  describe 'as a standard user logging in' do
    context 'with valid parameters' do
      before(:each) do
        @user = build(:standard)
        @password = @user.password
        @email = @user.email
        @user.save
      end

      it 'gets redirected to projects_index page' do
        visit('/sign_in')

        within(id: 'new_user') do
          fill_in('user_email', with: @email)
          fill_in('user_password', with: @password)
        end

        click_button 'Log in'
        expect(page).to have_current_path(projects_path)
      end
    end
  end
end
