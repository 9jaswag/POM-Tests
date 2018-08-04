# gem install selenium-webdriver - just in case you don't have selenium webdriver

require 'selenium-webdriver'
require_relative('./home_page.rb')

class InitPage
  @@driver = nil
  @@navigator = nil
  
  ROOT_URL = 'https://www.futurefinance.com/'
  OUR_LOANS_URL = "https://www.futurefinance.com/our-loans/"
  FAQS_URL = "https://www.futurefinance.com/faqs/"
  FACEBOOK_URL = "https://www.facebook.com/FutureFinanceLC/"
  VALIDATION_ERROR = "Please fill in this field."

  def initialize(driver)
    @@driver = driver
    @@navigator = Selenium::WebDriver::Navigation.new(@@driver)
  end

  def navigate_to_root_page
    @@driver.navigate.to('https://www.futurefinance.com/')
    HomePage.new(@@driver)
  end

  def quit
    @@driver.quit
  end

  def get_current_url
    @@driver.current_url
  end

  def go_back
    @@driver.navigate().back()
  end

  def switch_tab
    @@driver.switch_to.window(@@driver.window_handles[1])
  end
end
