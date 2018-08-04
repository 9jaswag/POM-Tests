# rspec test_scripts/external_page.test.rb command to run script
# rspec test_scripts/*.test.rb to run all tests once

require_relative('../page_objects/home_page.rb')

describe 'External link test' do
  app = nil

  before(:each) do
    app = InitPage.new(Selenium::WebDriver.for:chrome)
  end

  after(:each) do
    app.quit
  end

  it 'navigates to external facebook link' do
    app
      .navigate_to_root_page
      .navigate_to_facebook_page

    app.switch_tab
    sleep 5

    expect(app.get_current_url).to be == InitPage::FACEBOOK_URL
  end

end
