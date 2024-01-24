#command to run:
bundle exec rspec spec/task_management_spec.rb

#rails_helper 
is a common naming convention for a file that contains configuration and setup for RSpec tests 
in a Rails project. It includes necessary configurations for testing Rails applications

#require 'selenium-webdriver':
Selenium WebDriver is a library for automating web browsers
It provides classes and methods to interact with web elements
The Selenium WebDriver gem needs to be installed in your Ruby environment for this require statement to work.

#RSpec.describe 'Task Management', type: :feature, js: true do
RSpec.describe: This is an RSpec block used for defining a group of tests
type: :feature: This line specifies that the described tests are feature tests.
js: true: This line indicates that JavaScript support is needed for these tests

#before(:all) do
#sleep 3
#@driver = Selenium::WebDriver.for :chrome
before(:all): This is an RSpec hook that runs once before all the examples (tests) within the test group. 
sleep 3: This line introduces a 3-second delay
@driver = Selenium::WebDriver.for :chrome: This line creates a new instance of the Selenium WebDriver for the Chrome browser. 
This instance (@driver) will be used to interact with the browser during the tests.

#after(:all) do
#@driver.quit
after(:all): RSpec hook that runs once after all the examples (tests) within the test group have executed
@driver.quit: This line closes and quits the Selenium WebDriver instance

#it 'creates a new task' do
   #@driver.get('http://localhost:3000/tasks/new')
   #@driver.find_element(name: 'task[title]').send_keys('New Task')
   #@driver.find_element(name: 'task[description]').send_keys('Task Description')
   #@driver.find_element(name: 'commit').click
   #expect(@driver.find_element(css: '.notice').text).to include('Task was successfully created.')
#end
@driver.get('http://localhost:3000/tasks/new'): Navigates the browser to the URL.
@driver.find_element(name: 'task[title]').send_keys('New Task'): Locates the input field with the name 'task[title]' 
and types 'New Task' into it. This is simulating the input of the task title.
@driver.find_element(name: 'task[description]').send_keys('Task Description'): Locates the input field with the name 'task[description]' 
and types 'Task Description' into it.
@driver.find_element(name: 'commit').click: Locates the button with the name 'commit' and clicks it. 
This is simulating the submission of the form.
expect(@driver.find_element(css: '.notice').text).to include('Task was successfully created.') ->  there is an element
with the CSS selector '.notice' on the page, and its text includes the string 'Task was successfully created'

#it 'edits an existing task' do
    #task = Task.create(title: 'Task to Edit', description: 'Description for editing')
    #@driver.get("http://localhost:3000/tasks/#{task.id}/edit")
    #@driver.find_element(name: 'task[title]').clear
    #@driver.find_element(name: 'task[title]').send_keys('Edited Task')
    #@driver.find_element(name: 'commit').click
    #expect(@driver.find_element(css: '.notice').text).to include('Task was successfully updated.')
    #expect(@driver.find_element(css: '#task_title').text).to include('Edited Task')
#end
task = Task.create(title: 'Task to Edit', description: 'Description for editing'): Creates a new task in the 
database with the title 'Task to Edit' and the description 'Description for editing'
@driver.get("http://localhost:3000/tasks/#{task.id}/edit"): Navigates the browser to the edit page for the task
that was created in the previous step
@driver.find_element(name: 'task[title]').clear: Clears the existing content in the title input field
@driver.find_element(name: 'task[title]').send_keys('Edited Task'): Enters the new title 'Edited Task' 
into the title input field
@driver.find_element(name: 'commit').click: Clicks the submit button of the form
expect(@driver.find_element(css: '.notice').text).to include('Task was successfully updated.'): Asserts that a notice with the
text 'Task was successfully updated.' is present on the page, indicating that the task was edited successfully
expect(@driver.find_element(css: '#task_title').text).to include('Edited Task'): Asserts that the element with the ID 'task_title' has
the text 'Edited Task', ensuring that the task title was updated

#it 'deletes an existing task' do
    #task = Task.create(title: 'Task to Delete', description: 'Description for deletion')
    #@driver.get("http://localhost:3000/tasks/#{task.id}")
    #@driver.find_element(link_text: 'Destroy').click
    #@driver.switch_to.alert.accept
    #expect(@driver.find_element(css: '.notice').text).to include('Task was successfully destroyed.')
#end
task = Task.create(title: 'Task to Delete', description: 'Description for deletion'): Creates a new task in the database with the title 'Task to Delete'
and the description 'Description for deletion'
@driver.get("http://localhost:3000/tasks/#{task.id}"): Navigates the browser to the page of the task that was created in the
previous step
@driver.find_element(link_text: 'Destroy').click: Locates the link with the text 'Destroy' and clicks it. This usually triggers the 
initiation of the deletion process.
@driver.switch_to.alert.accept: Switches to the JavaScript alert dialog (confirmation box) and accepts it. This is typically the confirmation
step when deleting an item.
expect(@driver.find_element(css: '.notice').text).to include('Task was successfully destroyed.'): Asserts that a notice with the text 'Task was successfully destroyed.' 