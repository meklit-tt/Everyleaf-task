require 'rails_helper'

describe 'Task management function', type: :system do
  describe 'List display function' do
    context 'When transitioning to the list screen' do
      it 'The created task list is displayed' do
        # Create a task for use in testing
        task = FactoryBot.create(:task, title: 'task')
        task = FactoryBot.create(:task, detail: 'task')
        # Transition to task list page
        visit tasks_path
        # The text "task" appears on the visited (transitioned) page (task list page)
        # expect (confirm/expect) that have_content is included (is included)
        expect(page).to have_content 'task'
        # The result of expect is true Then test successful, false If so, the result is output as a failure
      end
    end
  end
end
2020-12-17 14:07:13 WARN Selenium [DEPRECATION] Selenium::WebDriver::Chrome#driver_path= is deprecated. Use Selenium::WebDriver::Chrome::Service#driver_path= instead.
2020-12-17 14:07:15 WARN Selenium [DEPRECATION] Selenium::WebDriver::Chrome#driver_path= is deprecated. Use Selenium::WebDriver::Chrome::Service#driver_path= instead.

Task management function
  List display function
    When transitioning to the list screen
2020-12-17 14:07:19 WARN Selenium [DEPRECATION] :args or :switches is deprecated. Use Selenium::WebDriver::Chrome::Options#add_argument instead.
      The created task list is displayed (FAILED - 1)

Failures:

  1) Task management function List display function When transitioning to the list screen The created task list is displayed
     Failure/Error: task = FactoryBot.create(:task, title: 'task')

     ActiveRecord::RecordInvalid:
       Validation failed: User must exist

     Capybara starting Puma...
* Version 3.12.6 , codename: Llamas in Pajamas
* Min threads: 0, max threads: 4
* Listening on tcp://127.0.0.1:44143
[Screenshot]: tmp/screenshots/failures_r_spec_example_groups_task_management_function_list_display_function_when_transitioning_to_the_list_screen_the_created_task_list_is_displayed_502.png


     # ./spec/system/task_spec.rb:8:in `block (4 levels) in <top (required)>'

Finished in 7.63 seconds (files took 10.23 seconds to load)
1 example, 1 failure

Failed examples:

rspec ./spec/system/task_spec.rb:6 # Task management function List display function When transitioning to the list screen The created task list is displayed


An error occurred while loading ./spec/system/task_spec.rb.
Failure/Error: __send__(method, file)

SyntaxError:
  /home/meklu/series-tasks/Everyleaf/spec/system/task_spec.rb:20: syntax error, unexpected tINTEGER, expecting end-of-input
  2020-12-17 14:07:13 WARN Selenium [DEPRECA...
             ^~
# /home/meklu/.rbenv/versions/2.6.5/lib/ruby/gems/2.6.0/gems/rspec-core-3.9.3/lib/rspec/core/configuration.rb:2106:in `load'
# /home/meklu/.rbenv/versions/2.6.5/lib/ruby/gems/2.6.0/gems/rspec-core-3.9.3/lib/rspec/core/configuration.rb:2106:in `load_file_handling_errors'
# /home/meklu/.rbenv/versions/2.6.5/lib/ruby/gems/2.6.0/gems/rspec-core-3.9.3/lib/rspec/core/configuration.rb:1609:in `block in load_spec_files'
# /home/meklu/.rbenv/versions/2.6.5/lib/ruby/gems/2.6.0/gems/rspec-core-3.9.3/lib/rspec/core/configuration.rb:1607:in `each'
# /home/meklu/.rbenv/versions/2.6.5/lib/ruby/gems/2.6.0/gems/rspec-core-3.9.3/lib/rspec/core/configuration.rb:1607:in `load_spec_files'
# /home/meklu/.rbenv/versions/2.6.5/lib/ruby/gems/2.6.0/gems/rspec-core-3.9.3/lib/rspec/core/runner.rb:102:in `setup'
# /home/meklu/.rbenv/versions/2.6.5/lib/ruby/gems/2.6.0/gems/rspec-core-3.9.3/lib/rspec/core/runner.rb:86:in `run'
# /home/meklu/.rbenv/versions/2.6.5/lib/ruby/gems/2.6.0/gems/rspec-core-3.9.3/lib/rspec/core/runner.rb:71:in `run'
# /home/meklu/.rbenv/versions/2.6.5/lib/ruby/gems/2.6.0/gems/rspec-core-3.9.3/lib/rspec/core/runner.rb:45:in `invoke'
# /usr/bin/rspec:4:in `<main>'
#
#   Showing full backtrace because every line was filtered out.
#   See docs for RSpec::Configuration#backtrace_exclusion_patterns and
#   RSpec::Configuration#backtrace_inclusion_patterns for more information.
No examples found.

Finished in 0.00002 seconds (files took 0.18012 seconds to load)
0 examples, 0 failures, 1 error occurred outside of examples
