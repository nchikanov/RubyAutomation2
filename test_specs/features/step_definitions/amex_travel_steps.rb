

Then(/^I verify that flight info from "([^"]*)" to "([^"]*)" to "([^"]*)" with "([^"]*)", "([^"]*)", and "([^"]*)" in "([^"]*)" is displayed$/) do |place1, place2, place3, seniors, adults, children, class_type|
  @util.verifyElementExists('Airport 1 From', place1)
  @util.verifyElementExists('Airport 1 To', place2)
  @util.verifyElementExists('Airport 2 From', place2)
  @util.verifyElementExists('Airport 2 To', place3)
  @util.verifyElementExists('Airport 3 From', place3)
  @util.verifyElementExists('Airport 3 To', place1)
  @util.verifyElementExists('Multi Class Type', class_type)

  totalpassengers = seniors.to_i + adults.to_i + children.to_i
  @util.verifyElementExists('Multi Total Passengers', totalpassengers)
end

When(/^I set the radio button to "([^"]*)"$/) do |arg|
  @util.selectRadioButton(arg)
end

And(/^I set the radio buttons to "([^"]*)" and "([^"]*)"$/) do |button1, button2|
  @util.selectRadioButton(button1)
  @util.selectRadioButton(button2)

end

And(/^I set the "([^"]*)" fields with "([^"]*)" value and "([^"]*)" value$/) do |element, value1, value2|
 case element
   when 'Children Age Hotel' then
     @bookhotelspage.set2values(element, value1, value2)
   when 'Where are you going' then
     @bookflightspage.set2values(element, value1, value2)
   when 'When are you going' then
     @bookflightspage.set2values(element, value1, value2)
   when 'Children Age' then
     @bookflightspage.set2values(element, value1, value2)
   when 'Car Rental Time' then
     @bookcarspage.set2values(element, value1, value2)
   when 'Do you have any specific preferences' then
     @bookcarspage.set2values(element, value1, value2)
 end

end


And(/^I set the "([^"]*)" field with "([^"]*)" value$/) do |element, value|
  case element
    when 'Where will you pick up the car' then
      @bookcarspage.setValue(element, value)
      @bookcarspage.selectItemInAutosuggest('car pickup', value)
    when 'Where are you going Hotel' then
      @bookhotelspage.setvalue(element, value)
    when 'When are you going Departure' then
      @bookflightspage.setvalue(element, value)
    when 'When are you going Return' then
      @bookflightspage.setvalue(element, value)
  end

end

And(/^I set the "([^"]*)" fields with "([^"]*)", "([^"]*)", "([^"]*)", "([^"]*)", "([^"]*)" and "(.*) values$/) do |element, place1, place2, place3, time1, time2, time3|
  datepicked = Date.today+7

  element1 = "Where and when are you going"
  element2 = "Where and when are you going_2"
  element3 = "Where and when are you going_3"

  @bookflightspage.set2values(element1, place1, place2)
  @mainpage.clickButton('departure date')
  @util.selectDateFromDatePicker(datepicked.strftime('%m/%d/%Y'))
  @bookflightspage.setValue(element1, time1)

  @bookflightspage.set2values(element2, place2, place3)
  @mainpage.clickButton('departure date 2')
  @util.selectDateFromDatePicker((datepicked+30).strftime('%m/%d/%Y'))
  @bookflightspage.setValue(element2, time2)

  @bookflightspage.set2values(element3, place3, place1)
  @mainpage.clickButton('departure date 3')
  @util.selectDateFromDatePicker((datepicked+60).strftime('%m/%d/%Y'))
  @bookflightspage.setValue(element3, time3)
end


And(/^I click on the lowest price option in flex matrix$/) do
  @bookflightspage.selectlowestprice('Flex')
end

And(/^I click on "([^"]*)" on the flight Matrix$/) do |airline|
  @mainpage.clickButton(airline)
end


And(/^I set the "([^"]*)" fields with "([^"]*)" value and "([^"]*)" and "([^"]*)" value of ages "([^"]*)" and "([^"]*)"$/) do |field, room, adults, children, age1, age2|
  #To set rooms, adults, and children
  @bookhotelspage.set3values(field, room, adults, children)

  #To set ages of children based on how many there are
  case room
    when '1' then
      if children.to_i == 1
        @bookhotelspage.setvalue('Children Age Hotel', age1)
      elsif children.to_i == 2
        @bookhotelspage.set2values('Children Age Hotel', age1, age2)
      end
    when '2' then
      if children.to_i == 1
        @bookhotelspage.setvalue('Children Age Hotel 2', age1)
      elsif children.to_i == 2
        @bookhotelspage.set2values('Children Age Hotel 2', age1, age2)
      end
    when '3' then
      if children.to_i == 1
        @bookhotelspage.setvalue('Children Age Hotel 3', age1)
      elsif children.to_i == 2
        @bookhotelspage.set2values('Children Age Hotel 3', age1, age2)
      end
    when '4' then
      if children.to_i == 1
        @bookhotelspage.setvalue('Children Age Hotel 4', age1)
      elsif children.to_i == 2
        @bookhotelspage.set2values('Children Age Hotel 4', age1, age2)
      end
    else
      puts "Unable to select children's ages"
  end

end


Then(/^I verify that hotels in "([^"]*)" for "([^"]*)" and "([^"]*)" and "([^"]*)" is displayed$/) do |city, adults, children, rooms|
  @util.verifyElementExists('hotel city', city)

  guests = (adults.to_i + children.to_i)*rooms.to_i
  @util.verifyElementExists('total guests', guests.to_i)

  @util.verifyElementExists('room number', rooms)
end

Then(/^I verify that flight info from "([^"]*)" to "([^"]*)" with "([^"]*)", "([^"]*)", and "([^"]*)" in "([^"]*)" is displayed on "([^"]*)" page$/) do |airport1, airport2, seniors, adults, children, class_type, page|

  totalpassengers = seniors.to_i + adults.to_i + children.to_i

  case page
    when 'Flex' then
      @util.verifyElementExists('Departure Airport', airport1)
      @util.verifyElementExists('Arrival Airport', airport2)
      @util.verifyElementExists('Class Type', class_type)

      @util.verifyElementExists('Total Passengers', totalpassengers)

    when 'Review Your Trip' then
      @util.verifyElementExists('Endpoint Departure', airport1)
      @util.verifyElementExists('Endpoint Departure 2', airport2)
      @util.verifyElementExists('Endpoint Arrival', airport2)
      @util.verifyElementExists('Endpoint Arrival 2', airport1)
      @util.verifyElementExists('Endpoint Class Type', class_type)

      kids = children.to_i / 2
      @util.verifyElementExists('Endpoint Adults', adults)
      @util.verifyElementExists('Endpoint Child In Seat', kids)
      @util.verifyElementExists('Endpoint Child In Lap', kids)

  end

end

Then(/^I print out total cost of "([^"]*)"$/) do |type|
  case type
    when 'Roundtrip Flight' then
      total = find(:xpath, ".//*[@class='total top']/span[@class='number _jq-total-price bentonSans']")::text()
      currency_symbol = find(:xpath, ".//*[@class='total top']/span[@class='super bentonBold']")::text()
      puts 'Total cost of roundtrip flight is: ' + currency_symbol + total
    when 'Car Booking' then
      total = find(:xpath, ".//*[@class='travel-benefits']/div/div/span[@class='number bentonSans _jq-total-price']")::text()
      currency_symbol = find(:xpath, ".//*[@class='travel-benefits']/div/div/span[@class='super bentonBold _jq-total-price-symbol']")::text()
      puts 'Total cost of car booking: ' + currency_symbol + total
    when 'Hotel Reservation' then
      sleep 2
      total = find(:xpath,".//*[@class='App-mainContent']/form/fieldset/div/div/div/div/div/p/span/span[@class='FormattedCurrency-amount']/span")::text()
      currency_symbol = find(:xpath, ".//*[@class='App-mainContent']/form/fieldset/div/div/div/div/div/p/span/span[@class='FormattedCurrency-symbol']")::text()
      puts 'Total cost of hotel reservation: ' + currency_symbol + total
  end

  #How to extract text from xpath and print to console#
  #Search for puts or print keywords, and challenge page and tasks page#
end


Then(/^I verify car pickup in "([^"]*)" on "([^"]*)" and dropoff on "([^"]*)" on "([^"]*)" page$/) do |city, time1, time2, page|
 case page
   when 'Search Cars' then
     @util.verifyElementExists('car pickup city', city)
     @util.verifyElementExists('car dropoff city', city)

     @util.verifyElementExists('car pickup time', time1)
     @util.verifyElementExists('car dropoff time', time2)

 end
end

Then(/^I verify car pickup with "([^"]*)" and "([^"]*)" on "([^"]*)" and dropoff on "([^"]*)" on "([^"]*)" page$/) do |aircon, transmission, time1, time2, page|
  case page
    when 'Review Your Car Booking' then
      if aircon == 'Yes'
        @util.verifyElementExists('AC Option', 'Air Conditioning')
      end

      @util.verifyElementExists('Transmission Option', transmission + ' Transmission')

      # NOTE - the following xpaths don't have 9:30 a.m. format but rather 9:30am
      # Could try to figure out how to detect the letters in the string and remove them, make a new string w/o alphanumeric characters
      # Try this in C++ to see if you remember!!
      @util.verifyElementExists('Car Pickup Time Review', time1)
      @util.verifyElementExists('Car Dropoff Time Review', time2)

  end
end

Then(/^I verify "([^"]*)" value, "([^"]*)" value, and "([^"]*)" value on "([^"]*)" page$/) do |rooms, adults, children, page|
  case page
    when 'Hotel Final Booking' then
      @util.verifyElementExists('Num Hotel Rooms Final', rooms)

      totalguests = (adults.to_i + children.to_i) * rooms.to_i
      @util.verifyElementExists('Hotel total guests Final', totalguests)

  end
end

And(/^I set the "([^"]*)" fields with "([^"]*)" values$/) do |fields, user|
  case fields
    when 'Traveler Information' then
      @bookcarspage.fillValue('First Name', @users.getUser(user, 'firstname'))
      @bookcarspage.fillValue('Last Name', @users.getUser(user, 'lastname'))
      @bookcarspage.fillValue('Email', @users.getUser(user, 'email'))
      @bookcarspage.fillValue('Country Code Car', @users.getUser(user, 'country phone code'))
      @bookcarspage.fillValue('Phone Number Car', @users.getUser(user, 'phone number'))

      #Save & Continue
      find(:xpath, ".//*[@id='_jq-form-who-is-driving']/button").click

      sleep 3

  end
end


And(/^I set the "([^"]*)" fields with "([^"]*)" and "([^"]*)", "([^"]*)", "([^"]*)", and "(.*) values$/) do |field, room, user1, user2, user3, user4|
  case field
    when 'Traveler Information Hotel' then
      case room
        when '1' then
          @bookhotelspage.fillValue('First Name 1', @users.getUser(user1, 'firstname'))
          @bookhotelspage.fillValue('Last Name 1', @users.getUser(user1, 'lastname'))
          @bookhotelspage.fillValue('Email', @users.getUser(user1, 'email'))
          @bookhotelspage.fillValue('Country Code Travel', @users.getUser(user1, 'country code'))
          @bookhotelspage.fillValue('Phone Number Travel', @users.getUser(user1, 'phone number'))

        when '2' then
          @bookhotelspage.fillValue('First Name 1', @users.getUser(user1, 'firstname'))
          @bookhotelspage.fillValue('Last Name 1', @users.getUser(user1, 'lastname'))
          @bookhotelspage.fillValue('Email', @users.getUser(user1, 'email'))
          @bookhotelspage.fillValue('Country Code Travel', @users.getUser(user1, 'country code'))
          @bookhotelspage.fillValue('Phone Number Travel', @users.getUser(user1, 'phone number'))

          sleep 1

          @bookhotelspage.fillValue('First Name 2', @users.getUser(user2, 'firstname'))
          @bookhotelspage.fillValue('Last Name 2', @users.getUser(user2, 'lastname'))

        when '3' then
          @bookhotelspage.fillValue('First Name 1', @users.getUser(user1, 'firstname'))
          @bookhotelspage.fillValue('Last Name 1', @users.getUser(user1, 'lastname'))
          @bookhotelspage.fillValue('Email', @users.getUser(user1, 'email'))
          @bookhotelspage.fillValue('Country Code Travel', @users.getUser(user1, 'country code'))
          @bookhotelspage.fillValue('Phone Number Travel', @users.getUser(user1, 'phone number'))

          sleep 1

          @bookhotelspage.fillValue('First Name 2', @users.getUser(user2, 'firstname'))
          @bookhotelspage.fillValue('Last Name 2', @users.getUser(user2, 'lastname'))
          sleep 1

          @bookhotelspage.fillValue('First Name 3', @users.getUser(user3, 'firstname'))
          @bookhotelspage.fillValue('Last Name 3', @users.getUser(user3, 'lastname'))
          sleep 1

        when '4' then
          @bookhotelspage.fillValue('First Name 1', @users.getUser(user1, 'firstname'))
          @bookhotelspage.fillValue('Last Name 1', @users.getUser(user1, 'lastname'))
          @bookhotelspage.fillValue('Email', @users.getUser(user1, 'email'))
          @bookhotelspage.fillValue('Country Code Travel', @users.getUser(user1, 'country code'))
          @bookhotelspage.fillValue('Phone Number Travel', @users.getUser(user1, 'phone number'))
          sleep 1

          @bookhotelspage.fillValue('First Name 2', @users.getUser(user2, 'firstname'))
          @bookhotelspage.fillValue('Last Name 2', @users.getUser(user2, 'lastname'))
          sleep 1

          @bookhotelspage.fillValue('First Name 3', @users.getUser(user3, 'firstname'))
          @bookhotelspage.fillValue('Last Name 3', @users.getUser(user3, 'lastname'))
          sleep 1

          @bookhotelspage.fillValue('First Name 4', @users.getUser(user4, 'firstname'))
          @bookhotelspage.fillValue('Last Name 4', @users.getUser(user4, 'lastname'))
          sleep 10

      end
  end
end

And(/^I set the "([^"]*)" fields with "([^"]*)"$/) do |field, user|
  case field
    when 'Payment Information' then
      @bookhotelspage.fillValue('Name on card', @payments.getPaymentInfo(user, 'Name on card'))
      sleep 1
      @bookhotelspage.fillValue('Card Type', @payments.getPaymentInfo(user, 'Card Type'))
      sleep 1
      @bookhotelspage.fillValue('Card Number', @payments.getPaymentInfo(user, 'Card Number'))
      sleep 1
      @bookhotelspage.fillValue('Exp. Month', @payments.getPaymentInfo(user, 'Exp. Month'))
      sleep 1
      @bookhotelspage.fillValue('Exp. Year', @payments.getPaymentInfo(user, 'Exp. Year'))
      sleep 1
      @bookhotelspage.fillValue('CID', @payments.getPaymentInfo(user, 'CID'))
      sleep 1
      @bookhotelspage.fillValue('Street Address', @payments.getPaymentInfo(user, 'Street Address'))
      sleep 1
      @bookhotelspage.fillValue('Country', @payments.getPaymentInfo(user, 'Country'))
      sleep 1
      @bookhotelspage.fillValue('Zip Code', @payments.getPaymentInfo(user, 'Zip Code'))
      sleep 1
      @bookhotelspage.fillValue('Town', @payments.getPaymentInfo(user, 'Town'))
      sleep 1
      @bookhotelspage.fillValue('State', @payments.getPaymentInfo(user, 'State'))
      sleep 1
      @bookhotelspage.fillValue('Country Code Payment', @users.getUser(user, 'country code'))
      sleep 1
      @bookhotelspage.fillValue('Phone Number Payment', @users.getUser(user, 'phone number'))
      sleep 1

  end
end