require 'rails_helper'

feature 'Manage tasks', js: true do
  scenario 'Add task to todo list' do
    #Visit the page
    visit todos_path

    #Fill in the form
    fill_in 'todo_title', with: 'Make some tests'

    #Submit the form
    page.execute_script("$('form').submit()")

    #Find the text on the page
    expect(page).to have_content('Make some tests')
  end

  scenario 'Counter at the bottom shows amount of tasks' do
    #Visit the page
    visit todos_path

    #Fill in the form
    fill_in 'todo_title', with: 'Test task #1'

    #Submit the form
    page.execute_script("$('form').submit()")

    #Fill in another form
    fill_in 'todo_title', with: 'Test task #2'

    #Submit the second form
    page.execute_script("$('form').submit()")

    #Expect to find that the total is now 2
    expect(page.find(:css, '#todo-count').text).to eq '2'
  end

  scenario 'complete a task' do
    #Visit the page
    visit todos_path

    #Fill in the form
    fill_in 'todo_title', with: 'Get a coffee'

    #Submit the form
    page.execute_script("$('form').submit()")

    #Check the done checkbox
    check('#todo-1')
    
    #Expect number of todo's to be 0
    expect(page.find(:css, '#todo-count').text).to eq '0'
  end
end
