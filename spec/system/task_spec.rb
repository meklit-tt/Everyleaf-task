require 'rails_helper'
RSpec.describe 'Task management function', type: :system do
      describe 'New creation function' do
          context 'When creating a new task' do
               it 'Should display created task' do
                 visit new_task_path
                    fill_in 'Title', with: 'Task2'
                       fill_in 'Detail', with: 'details2'
                          click_button 'Create Task'
                              expect(page).to have_content 'task created'
                               end
                               end
                              end
                              describe 'show creation function' do
                                  context 'When creating a new task' do
                                       it 'Should show created task' do
                                         visit new_task_path
                                            fill_in 'Title', with: 'Task2'
                                               fill_in 'Detail', with: 'details2'
                                                 click_button 'Create Task'
                                                  click_button 'Show'
                                                      expect(page).to have_content 'Task2'
                                                        expect(page).to have_content 'details2'
                                                       end
                                                       end
                                                      end
                                                      describe 'Edit creation function' do
                                                          context 'When creating a new task' do
                                                               it 'Should edit created task' do
                                                                 visit new_task_path
                                                                    fill_in 'Title', with: 'Task2'
                                                                       fill_in 'Detail', with: 'details2'
                                                                          click_button 'Create Task'
                                                                          click_button 'Edit'
                                                                              expect(page).to have_content 'Task2'
                                                                                expect(page).to have_content 'details2'
                                                                               end
                                                                               end
                                                                              end
                                                                              describe 'New Destroy function' do
                                                                                  context 'When deleting a new task' do
                                                                                       it 'Should display deleted task' do
                                                                                            visit new_task_path
                                                                                             fill_in 'Title', with: 'Task2'
                                                                                             fill_in 'Detail', with: 'details2'
                                                                                              click_button 'Create Task'
                                                                                              click_button 'Destroy'
                                                                                            
                                                                                                       end
                                                                                                       end
                                                                                                      end
  end
