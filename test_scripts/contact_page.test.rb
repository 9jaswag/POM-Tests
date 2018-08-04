# rspec test_scripts/contact_page.test.rb command to run script
# rspec test_scripts/*.test.rb to run all tests once

require_relative('../page_objects/home_page.rb')

describe 'Contact page test' do
  app = nil

  before(:each) do
    app = InitPage.new(Selenium::WebDriver.for(:chrome))
  end

  after(:each) do
    app.quit
  end

  it 'does not submit the contact form if email is missing' do
    invalid_field_message = app
      .navigate_to_root_page
      .navigate_to_contact_page
      .enter_name('John', 'Doe')
      .enter_message('Testing shii out')
      .submit_form
      .find_validation_error

      expect(invalid_field_message).to eq InitPage::VALIDATION_ERROR
  end

  it 'does not submit the contact form if message is missing' do
    invalid_field_message = app
      .navigate_to_root_page
      .navigate_to_contact_page
      .enter_name('John', 'Doe')
      .enter_email('johndoe@email.com')
      .submit_form
      .find_validation_error

      expect(invalid_field_message).to eq InitPage::VALIDATION_ERROR
  end

end
