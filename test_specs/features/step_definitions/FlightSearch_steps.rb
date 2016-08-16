Given(/^I navigate to the Add Car Page$/) do
  @addcarpage.load
  page.driver.browser.manage.window.maximize
end

And(/^I set the "([^"]*)" field with "([^"]*)" value$/) do |field, value|
  @bookflightpage.setValue(field, value)
  sleep 3
end

And(/^I fill in "([^"]*)" field with "([^"]*)" value$/) do |field, value|
  @addcarpage.fillValue(field, value)
end

And(/^I click on "([^"]*)" button$/) do |button|
   @addcarpage.clickButton(button)
  sleep 20
end

Then(/^I verify the "([^"]*)" page is displayed$/) do |page|
  case page
    when 'Manage car reservation' then
      result = false
      waitTime = Time.now + 10
      while Time.now < waitTime and !result do
        result = current_url.include?('/car/manage')
      end
    when 'Cancel Car Reservation' then
      result = false
      waitTime = Time.now + 12
      while Time.now < waitTime and !result do
        result = find(:xpath, "//h1[text()='Cancel Car Reservation']", visible: true)
      end
    when 'Add Car' then
      result = false
      waitTime = Time.now + 10
      while Time.now < waitTime and !result do
        result = find(:xpath, "//h2[text()='Add a Car to Your Stay?']", visible: true)
      end
    when 'Modify Car Reservation' then
      result = false
      waitTime = Time.now + 10
      while Time.now < waitTime and !result do
        result = current_url.include?('car/modify')
      end
  end
end

Given(/^I navigate to the "([^"]*)" Page$/) do |url|
  @util.setPageUrl @urls.getUrl(url)
  puts @urls.getUrl(url)
  sleep 3
end


And(/^I set the "([^"]*)" field with "([^"]*)" value from Modify Reservation page$/) do |field, value|
  @modifyreservationpage.setValue(field, value)
  sleep 3
end

Then(/^I verify the "([^"]*)" field is empty$/) do |field|
  @util.verifyFieldIsEmpty(field).should eq(true)
end

And(/^I verify "([^"]*)" field is displayed$/) do |element|
  @util.verifyElementExists(element)
end


And(/^I check the "([^"]*)" checkbox$/) do |field|
  @util.setCheckbox(field, true)
  sleep 5
end

And(/^I verify that "([^"]*)" field has the "([^"]*)" value$/) do |field, value|
  case field
    when 'Pick Up location on HSK' then
      within(:xpath,".//*[@id='searchForm_pickUpLocation']") do
        has_xpath?(".//input[contains(@value,'#{value}')]")
      end
  end
end

And(/^I click on "([^"]*)" field$/) do |arg|
  @modifyreservationpage.searchlocationmodify_field.click
end

Then(/^I verify the "([^"]*)" is expanded$/) do |element|
  @util.verifyElementExists(element)
end

Given(/^I login to the "([^"]*)" page with "([^"]*)" user$/) do |url, user|
  @util.setPageUrl @urls.getUrl(url)
  puts @urls.getUrl(url)
  @bookflightpage.clickButton 'Login'
  @bookflightpage.fillValue 'Username', @users.getUser(user, 'username')
  @bookflightpage.fillValue 'Password', @users.getUser(user, 'password')
  @bookflightpage.clickButton 'LOGIN'
  sleep 3
end