require 'rails_helper'

describe 'Task management function', type: :system do
  describe 'List display function' do
    context 'When transitioning to the list screen' do
      it 'The created task list is displayed' do
        # Create a task for use in testing
        task = FactoryBot.create(:task, title:  'task')
        task = FactoryBot.create(:task, detail: 'task')
        # Transition to task list page
        visit tasks_path
        # The text "task" appears on the visited (transitioned) page (task list page)
        # expect (confirm/expect) that have_content is included (is included)
        expect(page).to have_title 'task'
        expect(page).to have_detail 'task'
        # The result of expect is true Then test successful, false If so, the result is output as a failure
      end
    end
  end
end
