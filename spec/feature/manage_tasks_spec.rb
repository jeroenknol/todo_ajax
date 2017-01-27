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
end
