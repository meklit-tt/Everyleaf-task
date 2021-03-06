require 'rails_helper'
RSpec.describe 'Label function', type: :system do
  before do
    FactoryBot.create(:user, name: 'thisme',
                             email: 'this@me.com',
                             password: '098765',
                             password_confirmation: '098765')
    visit new_session_path
    fill_in 'Email', with: 'this@me.com'
    fill_in 'Password', with: '098765'
    click_button 'Log in'
    @user = User.first
    FactoryBot.create(:label, name: "good", user_id: @user.id)
    FactoryBot.create(:label, name: "poor", user_id: @user.id)

  end

  describe 'New creation function' do
    context 'When creating a new label' do
      it 'Should display created Label' do
        visit new_label_path
        fill_in 'Name', with: 'good'
        fill_in 'Name', with: 'poor'
        click_button 'Create Label'
        expect(page).to have_content 'successfully created.'
      end
    end
  end

  describe 'Adding multiple labels to tasks function' do
    context 'When you add labels to task' do
      it 'Task created with Lable' do
        Label.create(name: 'good')
        visit new_task_path
        fill_in 'Title', with: 'Task1'
        fill_in 'Detail', with: 'details'
        fill_in 'Deadline', with: '2019-9-28'
        select 'Inprogress'
        page.has_field?('good', checked: true)
        page.has_field?('poor', checked: true)
        click_button 'Create Task'
        expect(page).to have_content 'task created'
      end
    end
  end
  describe 'Search function' do
    context 'When you search by label' do
      it "Filter by tasks that includes selected labels" do
        label = Label.create(name: 'good')
        label = Label.create(name: 'good')
        task = Task.create(title: "title1", detail: "content1", deadline: "2021-1-1", status:"Complete", priority: "Low", user_id: @user.id)
        labelling = Labelling.create(label_id: label.id)
        visit tasks_path
        select 'good'
        select 'poor'
        click_on 'Search'
        expect(page).to have_content 'good'
        assert Task.ransack(status:[:q] , title: [:q], label:[:q])
      end
    end
  end
end
