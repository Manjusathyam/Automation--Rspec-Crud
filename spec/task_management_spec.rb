require 'rails_helper'
require 'selenium-webdriver'

RSpec.describe 'Task Management', type: :feature, js: true do
  before(:all) do
    sleep 3
    @driver = Selenium::WebDriver.for :chrome
  end

  after(:all) do
    sleep 3
    @driver.quit
  end

  it 'creates a new task' do
    sleep 3
    @driver.get('http://localhost:3000/tasks/new')
    sleep 3

    @driver.find_element(name: 'task[title]').send_keys('creating first task')
    sleep 3
    @driver.find_element(name: 'task[description]').send_keys('creating Description for first task')

    sleep 3
    @driver.find_element(name: 'commit').click

    sleep 3
    expect(@driver.find_element(css: '.notice').text).to include('Task was successfully created.')
  end

  it 'edits an existing task' do
    sleep 3
    task = Task.create(title: 'Task to Edit', description: 'Description for editing')
    sleep 3
    @driver.get("http://localhost:3000/tasks/#{task.id}/edit")

    sleep 3
    @driver.find_element(name: 'task[title]').clear
    sleep 3
    @driver.find_element(name: 'task[title]').send_keys('Edited Task')

    sleep 3
    @driver.find_element(name: 'commit').click

    sleep 3
    expect(@driver.find_element(css: '.notice').text).to include('Task was successfully updated.')
    sleep 3
    expect(@driver.find_element(css: '#task_title').text).to include('Edited Task')
  end

  it 'deletes an existing task' do
    sleep 3
    task = Task.create(title: 'Task to Delete', description: 'Description for deletion')
    sleep 3
    @driver.get("http://localhost:3000/tasks/#{task.id}")

    sleep 3
    @driver.find_element(link_text: 'Destroy').click

    sleep 3
    @driver.switch_to.alert.accept

    sleep 3
    expect(@driver.find_element(css: '.notice').text).to include('Task was successfully destroyed.')
    sleep 3
  end
end
