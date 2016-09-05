And(/^I click on the "([^"]*)" button$/) do |button|
  sleep 1
  @util.clickButton(button)
  sleep 1
end

Then(/^I select "([^"]*)" option from the "([^"]*)" dropdown menu$/) do |string, field|
  case field
    when 'first' then
      find(:xpath, ".//*[@id='flight_search_flight_search_slices_attributes_0_departure_search_for']").click
      @bookflightspage.selectItemInAutosuggest('airport1', string)
    when 'second' then
      find(:xpath, ".//*[@id='flight_search_flight_search_slices_attributes_0_arrival_search_for']").click
      @bookflightspage.selectItemInAutosuggest('airport2', string)
    when 'dept time' then
      find(:xpath, ".//*[@id='flight_search_flight_search_slices_attributes_0_departure_hour_range_input']/a/span[1]").click
      @bookflightspage.selectItemInAutosuggest(field, string)
    when 'ret time' then
      find(:xpath, ".//*[@id='flight_search_flight_search_slices_attributes_1_departure_hour_range_input']/a").click
      @bookflightspage.selectItemInAutosuggest(field, string)
    when 'fare class' then
      find(:xpath, ".//*[@id='flight_search_cabin_type_input']/a").click
      @bookflightspage.selectItemInAutosuggest(field, string)
    when 'car rental company' then
      find(:xpath, ".//*[@id='car_search_vendor_code_filters_input']/a/span[text()='No Preference']").click
      @bookcarspage.selectItemInAutosuggest(field, string)
  end
end

When(/^I click on the "([^"]*)" button with "([^"]*)", "([^"]*)", and "([^"]*)"$/) do |_, seniors, adults, children|
  if seniors.to_i > 0
    find(:xpath, ".//*[@id='flight_search_traveler_groups_seniors_input']/a").click
    find(:xpath, "html/body/ul[8]/li/a[text()='#{seniors.to_i}']").click
  end

  if adults.to_i > 0
    find(:xpath, ".//*[@id='flight_search_traveler_groups_adults_input']/a").click
    find(:xpath, "html/body/ul[7]/li/a[text()='#{adults.to_i}']").click
  end

  if children.to_i > 0
    find(:xpath, ".//*[@id='flight_search_traveler_groups_child_count_input']/a").click
    find(:xpath, "html/body/ul[9]/li/a[text()='#{children.to_i}']").click
  end
end


And(/^I click on the "([^"]*)" button on "([^"]*)" page$/) do |button, page|
  case page
    when 'AmexFlight Booking' then
      if button == 'Search'
        find(:xpath, ".//*[@id='new_flight_search']/fieldset/ol/li/input[@value='Search Flights']").click
      elsif button == 'Add cheapest hotel'
        @bookflightspage.findCheapestHotel
      elsif button == 'Continue without Hotel'
        find(:xpath, ".//*[@class='continue-without-hotel']").click
      elsif button == 'Traveler Save & Continue'
        find(:xpath, ".//*[@id='traveler-info-checkout']/div/div/div/button").click
      elsif button == 'Continue Booking'
        find(:xpath, ".//*[@id='seats-selection-info']/div/div[1]/div/div/a[text()='Continue Booking']").click
      elsif button == 'I have read and agree to the policies, rules, and restrictions'
        find(:xpath, ".//*[@id='booking-info']/div/div/div/div/div/span[@class='ui-checkbox']").click

      end


    when 'Flex' then
      if button == 'Select on the first Airline flight card'

        @bookflightspage.selectfirstbutton
        sleep 5
      end
    when 'AmexCars Booking' then
      if button == 'Search Cars'
        find(:xpath, ".//*[@id='new_car_search']/fieldset/ol/li/input[@value='Search Cars']").click
      end
    when 'AmexHotel Booking' then
      if button == 'Search Hotels'
        find(:xpath, ".//*[@id='new_hotel_search']/fieldset/ol/li/input[@value='Search Hotels']").click
      elsif button == 'Book Hotel'
        @bookhotelspage.selectfirstbutton('Book Hotel')
        sleep 5
      elsif button == 'Select best value hotel'
        @bookhotelspage.selectfirstbutton('Select best value hotel')
      elsif button == 'Review and Submit Hotel'
        @util.clickButton('Review and Submit Hotel')
      end
    else
      fail(ArgumentError.new('THIS STEP AINT WORKING'))
  end

  sleep 5
end

And(/^I select a date from the datepicker on the "([^"]*)" section$/) do |date|
  case date
    when 'dep' then
      @util.clickButton('departure date')
      datetopick = Date.today+90
    when 'ret' then
      @util.clickButton('return date')
      datetopick = Date.today+97
    when 'pick-up' then
      @util.clickButton('pick-up')
      datetopick = Date.today+90
    when 'drop-off' then
      @util.clickButton('drop-off')
      datetopick = Date.today+97
    when 'check-in date' then
      @util.clickButton('check-in date')
      datetopick = Date.today+90
    when 'check-out date' then
      @util.clickButton('check-out date')
      datetopick = Date.today+94

    else
      datetopick = Date.today
  end
  @util.selectDateFromDatePicker(datetopick.strftime('%m/%d/%Y'))
  sleep 5
end

When(/^I login with the given "([^"]*)"$/) do |user|
  @loginpage.fillValue('Email', @users.getUser(user, 'email'))

  next_button_exists = has_xpath? ".//*[@id='next']"
  if next_button_exists
    @loginpage.clickButton('Next')
    @loginpage.fillValue('Password', @users.getUser(user, 'password'))
  end
  @loginpage.fillValue('Password', @users.getUser(user, 'password'))
  @loginpage.clickButton('Sign In')

  @util.setCurrentUser(user)
end

Given(/^I navigate to the external "([^"]*)" site$/) do |site|
  @util.setPageUrl(@url.getUrl(site))
  @util.setCurrentSite(site)
end


And(/^I verify "([^"]*)" user received a "([^"]*)" email notification with "([^"]*)" content$/) do |user, subject, content|
  emailacc = @users.getUser(user,'email')
  emailpsw = @users.getUser(user,'password')
  match = emailacc[/\+(.*?)@/m]
  emailacc = emailacc.gsub(match,'@') unless match.nil? #retrieving mail w/o alias
  unless @util.mailHasContent(emailacc, emailpsw, subject, content, false)
    fail(ArgumentError.new("No content in email notification!"))
  end
end

When(/^I login to the "([^"]*)" with the given "([^"]*)"$/) do |site, user|
  # Go to page
  @util.setPageUrl(@url.getUrl(site))
  @util.setCurrentSite(site)

  # Login
  @loginpage.fillValue('Email', @users.getUser(user, 'email'))

  next_button_exists = has_xpath? ".//*[@id='next']"
  if next_button_exists
    @loginpage.clickButton('Next')
    @loginpage.fillValue('Password', @users.getUser(user, 'password'))
  end
  @loginpage.fillValue('Password', @users.getUser(user, 'password'))
  @loginpage.clickButton('Sign In')

  @util.setCurrentUser(user)

end

When(/^I fill in the "([^"]*)" field with "([^"]*)" value$/) do |arg1, value|
  @util.fill_value(arg1, value)
end

Then(/^I verify the "([^"]*)" page is displayed$/) do |page|
  case page
    when 'Checkout' then
      displayed = has_xpath? ".//*[@class='tittle-summary']/h2[text()='Review Your Flight Booking']"
      fail(ArgumentError.new('The Checkout page is not displayed!')) unless displayed

    when 'Review Your Trip' then
      displayed = has_xpath? ".//*[@class='tittle-summary']/h1[contains(text(),'Review Your Trip')]"
      fail(ArgumentError.new('The Review Your Trip page is not displayed!')) unless displayed

    when 'Review Your Car Booking' then
      displayed = has_xpath? ".//*[@class='banner']/h2[text()='Review Your Car Booking']"
      fail(ArgumentError.new('The Review Your Car Booking page is not displayed!')) unless displayed

    when 'Flex' then
      displayed = has_xpath? ".//*[@id='_iz']/div/div/div[@class='flex-matrix']"
      fail(ArgumentError.new('The flex matrix is not displayed!')) unless displayed

    when 'Interstitial' then
      displayed = has_xpath? ".//*[@id='_iz']/div/div/div/img[@class='loading-spin']"
      displayed2 = has_xpath? ".//*[@id='_iz']/div/div/div/div[@class='loading-waitingText'][contains(text(), 'One moment please...')]"
      fail(ArgumentError.new('The Intersitial page is not displayed!')) unless displayed && displayed2

    when 'Hotel Rooms & Rates' then
      displayed = has_xpath?".//*[@class='rooms ui-state-default ui-corner-top ui-tabs-selected ui-state-active']/a[text()='Rooms & Rates']"
      fail(ArgumentError.new('The Hotel Rooms & Rates page is not displayed!')) unless displayed

    when 'puppies' then
      displayed = has_xpath? ".//*[contains(@href,'puppies') and text()='Images for puppies']"
      fail(ArgumentError.new('The result of puppies is not displayed!')) unless displayed

    #get a new xpath
    when 'cookies' then
      displayed = has_xpath? ".//span[@class='metabar__term'][contains(text(), 'cookies')]"
      fail(ArgumentError.new('The result of cookies is not displayed!')) unless displayed

    #get a new xpath
    when 'ice cream' then
      displayed = has_xpath? ".//a[contains(@href,'ice%20cream')]"
      fail(ArgumentError.new('The result of ice cream is not displayed!')) unless displayed

    when 'FB Home' then
      displayed = has_xpath? ".//a[@class='fbxWelcomeBoxBlock fbxWelcomeBoxSmallLeft fbxWelcomeBoxProfilePicBlock _8o _8r lfloat _ohe']"
      fail(ArgumentError.new('The Facebook home page is not displayed!')) unless displayed

    when 'Gmail Home' then
      #verify the UI as well as the URL
      fail(ArgumentError.new('The Gmail home page is not displayed!')) unless
          has_xpath? ".//span[@class='gb_3a gbii']"

    when 'LI Home' then
      #verify the UI as well as the URL
      fail(ArgumentError.new('The Forgot Username page is not displayed!')) unless
          has_xpath? ".//*[@id='identity']/section/div/a[1]/img"
    else
      fail(ArgumentError.new("'#{page}' is not listed!"))
  end
end

Given(/^I navigate to the external "([^"]*)" site and I create a new "([^"]*)" with birthday "([^"]*)" "([^"]*)" "([^"]*)" and "([^"]*)"$/) do |site, user, month, day, year, gender|
  #Navigate
  @util.setPageUrl(@url.getUrl(site))
  @util.setCurrentSite(site)

  #Create User
  @loginpage.fillValue('First Name', @users.getUser(user, 'firstname'))
  @loginpage.fillValue('Last Name', @users.getUser(user, 'lastname'))
  @loginpage.fillValue('New Email', @users.getUser(user, 'email'))
  @loginpage.fillValue('New Email Repeat', @users.getUser(user, 'email'))
  @loginpage.fillValue('New Password', @users.getUser(user, 'password'))

  #Fill in Birthday
  find(:xpath, ".//*[@id='month']/option[contains(text(), '#{month}')]").click
  find(:xpath, ".//*[@id='day']/option[text() ='#{day}']").click
  find(:xpath, ".//*[@id='year']/option[contains(text(), '#{year}')]").click

  #Select Gender
  if gender == 'M'
    find(:xpath, ".//*[@id='u_0_e']").click
  else
    find(:xpath, ".//*[@id='u_0_d']").click
  end

  #Create New User
  @loginpage.clickButton('Sign Up')

  #Verify User was created Successfully
  fail(ArgumentError.new("Facebook Account was not created successfully")) unless has_xpath? ".//div[@class='title fsl fwb fcb' and text() ='Step 1']"

end


###################################################################################################################







