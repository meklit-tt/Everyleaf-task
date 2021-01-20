require 'rails_helper'
RSpec.describe 'User management function', type: :system do
      describe 'new user creation function' do
      context 'When Admin creating a new user' do
      it 'Admin should  create the new user' do
      visit new_admin_user_path
      fill_in 'name', with: 'test'
      fill_in 'email', with: 'test@me.com'
      fill_in 'password', with: '098765'
      fill_in 'password_confirmation', with: '098765'
      click_button 'submit'
      expect(page).to have_content 'new user added'
   end
  end
 end
     describe 'Show users page function' do
     context 'When admin creating a new user' do
     it 'Admin should show created user' do
     visit new_admin_user_path
     fill_in 'name', with: 'test'
     fill_in 'email', with: 'test@me.com'
     fill_in 'password', with: '098765'
     fill_in 'password_confirmation', with: '098765'
     click_button 'submit'
     click_button 'Show'
     expect(page).to have_content 'Sign up'
     end
   end
  end
     describe 'Edit users page function' do
     context 'When Admin creating a new user' do
     it 'Admin should edit created user ' do
     visit new_admin_user_path
     fill_in 'name', with: 'test'
     fill_in 'email', with: 'test@me.com'
     fill_in 'password', with: '098765'
     fill_in 'password_confirmation', with: '098765'
     click_button 'submit'
     click_button 'Edit'
     expect(page).to have_content 'Login'
     end
    end
  end
    describe 'Destroy users function' do
    context 'When Admin creating a new user' do
    it 'Admin should delete created user' do
    visit new_admin_user_path
    fill_in 'name', with: 'test'
    fill_in 'email', with: 'test@me.com'
    fill_in 'password', with: '098765'
    fill_in 'password_confirmation', with: '098765'
    click_button 'submit'
    click_button 'Destroy'
     end
   end
 end
    describe 'Login users function' do
    context 'When Admin creating a new user' do
    it 'User Should login to user task page' do
    visit new_admin_user_path
    fill_in 'name', with: 'test'
    fill_in 'email', with: 'test@me.com'
    fill_in 'password', with: '098765'
    fill_in 'password_confirmation', with: '098765'
    click_button 'submit'
    click_button 'Login'
    fill_in 'Email', with: 'test@me.com'
    fill_in 'Password', with: '098765'
    click_button 'Log in'
    expect(page).to have_content 'login succeed'
   end
  end
 end
 describe 'Create user task users function' do
 context 'When Admin creating a new user' do
 it 'User Should  create the new task' do
 visit new_admin_user_path
 fill_in 'name', with: 'test'
 fill_in 'email', with: 'test@me.com'
 fill_in 'password', with: '098765'
 fill_in 'password_confirmation', with: '098765'
 click_button 'submit'
 click_button 'Login'
 fill_in 'Email', with: 'test@me.com'
 fill_in 'Password', with: '098765'
 click_button 'Log in'
 expect(page).to have_content 'login succeed'
 click_button 'New Task'
 fill_in 'Title', with: 'Task3'
 fill_in 'Detail', with: 'details3'
 fill_in 'Deadline', with: '2020-1-20'
 click_button 'Create Task'
 expect(page).to have_content 'task created'
   end
  end
 end
    describe 'Logout user task function' do
    context 'When Admin creating a new user' do
    it 'User Should Logged out from user task page' do
    visit new_admin_user_path
    fill_in 'name', with: 'test'
    fill_in 'email', with: 'test@me.com'
    fill_in 'password', with: '098765'
    fill_in 'password_confirmation', with: '098765'
    click_button 'submit'
    click_button 'Login'
    fill_in 'Email', with: 'test@me.com'
    fill_in 'Password', with: '098765'
    click_button 'Log in'
    expect(page).to have_content 'login succeed'
    click_button 'New Task'
    fill_in 'Title', with: 'Task3'
    fill_in 'Detail', with: 'details3'
    fill_in 'Deadline', with: '2020-1-20'
    click_button 'Create Task'
    click_button 'Logout'
    expect(page).to have_content 'You logged out'
     end
   end
 end
end
