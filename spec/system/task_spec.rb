require 'rails_helper'
RSpec.describe 'Task management function', type: :system do
      describe 'New creation function' do
      context 'When creating a new task' do
      it 'Should display created task' do
      visit new_task_path
      fill_in 'Title', with: 'Task3'
      fill_in 'Detail', with: 'details3'
      fill_in 'Deadline', with: '2020-1-20'
      click_button 'Create Task'
      expect(page).to have_content 'task created'
  end
 end
end
      describe 'show creation function' do
      context 'When creating a new task' do
      it 'Should show created task' do
      visit new_task_path
      fill_in 'Title', with: 'Task3'
      fill_in 'Detail', with: 'details3'
      fill_in 'Deadline', with: '2020-1-20'
      click_button 'Create Task'
      click_button 'Show'
      expect(page).to have_content 'Task3'
      expect(page).to have_content 'details3'
   end
 end
end
      describe 'Edit creation function' do
      context 'When creating a new task' do
      it 'Should edit created task' do
      visit new_task_path
      fill_in 'Title', with: 'Task3'
      fill_in 'Detail', with: 'details3'
      fill_in 'Deadline', with: '2020-1-20'
      click_button 'Create Task'
      click_button 'Edit'
      expect(page).to have_content 'Task3'
      expect(page).to have_content 'details3'
    end
  end
end
      describe 'New Destroy function' do
      context 'When deleting a new task' do
      it 'Should display deleted task' do
      visit new_task_path
      fill_in 'Title', with: 'Task3'
      fill_in 'Detail', with: 'details3'
      fill_in 'Deadline', with: '2020-1-20'
      click_button 'Create Task'
      click_button 'Destroy'
   end
  end
end
      context 'When tasks are arranged in descending order of creation date and time' do
      it 'New task is displayed at the top' do
      visit tasks_path
      assert Task.all.order(created_at: "desc")
  end
end
      describe 'New sorting function' do
      context 'When creating a new task' do
      it 'Should display sorted task by deadline' do
      visit new_task_path
      fill_in 'Title', with: 'Task3'
      fill_in 'Detail', with: 'details3'
      fill_in 'Deadline', with: '2020-1-20'
      click_button 'Create Task'
      click_button 'sort by deadline'
      assert Task.all.order(deadline: "desc")
   end
  end
 end
      describe 'search creation function' do
      context 'When creating a new task' do
      it 'Should search created task by title' do
      visit new_task_path
      fill_in 'Title', with: 'Task3'
      fill_in 'Detail', with: 'details3'
      fill_in 'Deadline', with: '2020-1-20'
      click_button 'Create Task'
      click_button 'search'
      expect(page).to have_content 'Task3'
      assert Task.ransack(title:[:q])
   end
  end
 end
end
