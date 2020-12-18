require 'rails_helper'
describe 'Task model function', type: :model do
  describe 'Validation test' do
    context 'If the task title is empty' do
      it 'It's hard to Validation' do
        task = Task.new(title: '', detail: '' 'Failure test')
        expect(task).not_to be_valid
      end
    end
　　context 'If the task details are empty' do
      it 'Validation is caught' do
        # Write content here
      end
    end
    context 'When the content is described in the task title and details' do
      it 'Validation passes' do
        # Write content here
      end
    end
  end
