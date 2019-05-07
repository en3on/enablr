module ProjectEnablrMacros
  def login_fundraiser
    visit '/sign_in'
    within('form') do
      fill_in 'email', with: 'fundraiser@test.com'
      fill_in 'password', with: 'Password123'
    end
    click_button 'Log In'
  end

  def login_standard
    visit '/sign_in'
    within('form') do
      fill_in 'email', with: 'standard@test.com'
      fill_in 'password', with: 'Password123'
    end
    click_button 'Log In'
  end

  def logout
    visit '/'
    click_button 'Log out'
  end

  def enable_project
    @perk = Perk.last

    visit @perk
    within('form') do
      fill_in 'amount', with: @perk.minimum_amount
    end
    click_button 'Enable'
  end
end
