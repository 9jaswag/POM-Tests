# rspec test_scripts/faqs_page.test.rb command to run script
# rspec test_scripts/*.test.rb to run all tests once

require_relative('../page_objects/home_page.rb')

describe 'FAQS page test' do
  app = nil

  before(:each) do
    app = InitPage.new(Selenium::WebDriver.for(:chrome))
  end

  after(:each) do
    app.quit
  end

  it 'navigates to the FAQs page and back' do
    app
      .navigate_to_root_page
      .navigate_to_faqs_page

    expect(app.get_current_url).to be == InitPage::FAQS_URL
    
    app.go_back

    expect(app.get_current_url).to be ==InitPage:: ROOT_URL
  end

end
