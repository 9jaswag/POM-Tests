require_relative('./init_page.rb')

class ContactPage < InitPage
  def initialize(driver)
    super(driver)
  end

  def enter_name(first_name, last_name)
    @@driver.find_element(:id, 'input-first-name').send_keys first_name
    @@driver.find_element(:id, 'input-last-name').send_keys last_name
    ContactPage.new(@@driver)
  end

  def enter_email(email)
    @@driver.find_element(:id, 'input-email').send_keys email
    ContactPage.new(@@driver)
  end

  def enter_message(message)
    @@driver.find_element(:id, 'input-message').send_keys message
    ContactPage.new(@@driver)
  end
  
  def submit_form
    @@driver.find_element(:css, "input[type='submit']").click
    ContactPage.new(@@driver)
  end

  def find_validation_error
    invalid_field = @@driver.find_element(:css, "input:invalid")
    invalid_field.attribute("validationMessage")
  end
end
