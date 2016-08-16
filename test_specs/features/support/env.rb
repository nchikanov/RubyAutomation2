require 'rubygems'
require 'selenium-webdriver'
require 'capybara'
require 'capybara/node/matchers'
require 'capybara/cucumber'
require 'rspec/expectations'
require 'rspec/matchers'
require 'site_prism'
require 'site_prism/waiter'


# Set browser in which the automation will be executed: IE, CH, FF

$browser = 'CH'

Capybara.default_driver = :selenium
Capybara.javascript_driver = :webkit  #:chrome
Capybara.default_max_wait_time = 10

case $browser
  when 'CH'
  then
    Capybara.register_driver :selenium do |app|
      # Capybara::Selenium::Driver.new(app, :browser => :chrome, :profile=> 'default')
      caps = Selenium::WebDriver::Remote::Capabilities.chrome("chromeOptions" => {"args" => [ "--disable-extensions" ]})
      Capybara::Selenium::Driver.new(app, :browser => :chrome, :desired_capabilities => caps)


      # C:\Users\Pamela\AppData\Local\Google\Chrome\User Data\Default
      # ChromeOptions options = new ChromeOptions();
      # options.addArguments("user-data-dir=/path/to/your/custom/profile");
    end
    Capybara.default_driver = :selenium

  when 'IE'
  then
    Capybara.register_driver :selenium do |app|
      Capybara::Selenium::Driver.new(app, :browser => :internet_explorer)
    end
    Capybara.default_driver = :selenium

  when 'FF'
  then
    Capybara.register_driver :selenium do |app|
      Capybara::Selenium::Driver.new(app, :browser => :firefox, :profile => 'default')
        end
    Capybara.default_driver = :selenium
 end

Before do |scenario|
  puts "TC Start time: #{Time.now.to_s}"
  @bookflightpage = BookFlightPage.new
  @util = UtilPage.new
  @urls = URLs.new
  @users = Users.new
  
  puts "TC Start time: #{Time.now.to_s}"
  puts "Browser: #{$browser}"
end

After do |scenario|
  if scenario.failed?
    Dir::mkdir('output/screenshots') if not File.directory?('output/screenshots')
    case scenario
      when Cucumber::Ast::OutlineTable::ExampleRow
        @scenario_name = scenario.scenario_outline.name
      when Cucumber::Ast::Scenario
        @scenario_name = scenario.name
      else
        raise('Unhandled class')
    end
    page.driver.browser.action.key_down(:shift).send_keys('6').key_up(:shift).perform
    encoded_img = page.driver.browser.screenshot_as(:base64)
    embed("data:image/png;base64,#{encoded_img}",'image/png')
    screenshot = "output/screenshots/FAILED_#{@scenario_name.gsub(' ','_').gsub('|','_').gsub(/[^0-9A-Za-z_()]/, '')}_#{Time.new.strftime('%Y%m%d-%H%M%S')}.png"
    page.driver.browser.save_screenshot(screenshot)
  end
end

