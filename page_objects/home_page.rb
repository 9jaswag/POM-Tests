require_relative('./init_page.rb')
require_relative('./contact_page.rb')

class HomePage < InitPage
  def initialize(driver)
    super(driver)
  end
  
  def navigate_to_contact_page
    @@driver.find_element(:link_text, 'Contact Us').click
    ContactPage.new(@@driver)
  end

  def navigate_to_our_loans_page
    @@driver.find_element(:link_text, 'Our Loans').click
  end

  def navigate_to_faqs_page
    @@driver.find_element(:link_text, 'FAQs').click
  end

  def navigate_to_facebook_page
    @@driver.find_element(:css, ".navigation-social a:first-child").click
  end
end
