require 'rails_helper'
RSpec.describe 'Task management function', type: :model do
  describe 'List display function' do
    context 'When transitioning to the list screen' do
      it 'The created task list is displayed by title' do
      Task.create( title: 'tak', detail: 'ttt', deadline: '2020-9-3', status:'completed', priority:'1')
      expect(Task.search_title('tak').count).to eq 1
  end
end
      context 'When transitioning to the list screen' do
       it 'The searched task list is displayed by status' do
      Task.create( title: 'sec', detail: 'ttt', deadline: '2020-9-3', status:'inprogress', priority:'2')
      expect(Task.search_status("inprogress").count).to eq 1
    end
  end
     context 'When the status is searched with the scope method' do
     it "Tasks that exactly match the status are narrowed down" do
     Task.create( title: 'thir', detail: 'ttt', deadline: '2020-9-3', status:'unstarted', priority:'2')
     expect(Task.search_status("unstarted").count).to eq 1
     end
  end
      context 'When ambiguous title search and status search are performed by scope method' do
      it "Tasks that include the search keyword in the title and exactly match the status are narrowed down" do
       Task.create( title: 'thi', detail: 'ttt', deadline: '2020-9-3', status:'unstarted', priority:'3')
    #   expect(Task.search_title(title:'thi').not_to include(status: 'unstarted'))
    end
   end
 end
end
