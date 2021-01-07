require 'rails_helper'
RSpec.describe 'Task management function', type: :system do
  describe 'List display function' do
    context 'When transitioning to the list screen' do
      it 'The created task list is displayed' do
      task = FactoryBot.create(:task, title: 'task')
      task = FactoryBot.create(:task, detail: 'task')
      task = FactoryBot.create(:task, deadline: 'task')
      visit tasks_path
      expect(page).to have_content 'Task'
    end
   end
end

   describe 'List display function' do
    context 'When transitioning to the list screen' do
      it 'The created task list is displayed' do
        task = FactoryBot.create(:task, title: 'task')
        task = FactoryBot.create(:task, detail: 'task')
        task = FactoryBot.create(:task, deadline: 'task')
        visit tasks_path
        expect(page).to have_content 'test_detail'
      end
    end
  end
  describe 'Detailed display function' do
     context 'When transitioned to any task details screen' do
       it 'The content of the relevant task is displayed' do
         task = FactoryBot.create(:task, title: 'task')
         task = FactoryBot.create(:task, detail: 'task')
         task = FactoryBot.create(:task, deadline: 'task')
         visit tasks_path
         expect(page).to have_content 'detail'
       end
     end
  end

describe 'Detailed display function' do
   context 'When transitioned to any task details screen' do
     it 'The content of the relevant task is displayed' do
       task = FactoryBot.create(:task, title: 'task')
       task = FactoryBot.create(:task, detail: 'task')
       task = FactoryBot.create(:task, deadline: 'task')
       visit tasks_path
       expect(page).to have_content 'deadline'
     end
   end
end
end
