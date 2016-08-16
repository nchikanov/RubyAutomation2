And(/^I click on the "([^"]*)" button on "([^"]*)" page$/) do |button, page|
  case page
    when 'Book a Flight' then
      @bookflightpage.clickButton(button)
      sleep 2
      # @addcarpage.clickButton(button)
      # Capybara.default_max_wait_time = 15
      # result = false
      # waitTime = Time.now + 15
      # while Time.now < waitTime and !result do
      #   result = find(:xpath, "//button[contains(@type,'button')and text()='CANCEL RESERVATION']", visible: true)
      #   # result = has_xpath? ("//button[contains(@type,'button')and text()='CANCEL RESERVATION']")
      # end
    when 'Post' then
      @ihgpostpage.clickButton(button)
    when 'Manage car Reservation' then
      @managereservationpage.clickButton(button)
    when 'Cancel Car Reservation' then
      @cancelreservationpage.clickButton(button)
    when 'Modify Reservation' then
      @managereservationpage.clickButton(button)
    when 'Modify Car Reservation' then
      @modifyreservationpage.clickButton(button)
  end
end


And(/^I fill in "([^"]*)" field with "([^"]*)" value on "([^"]*)" form$/) do |field, value, form|
  case form
    when 'Book a Car' then
      @addcarpage.fillValue(field, value)
    when 'IHG Post' then
      @ihgpostpage.fillValue(field, value)
    else
      fail(ArgumentError.new("'#{form}' form is not displayed."))
  end
end

Then(/^I verify the "([^"]*)" message is displayed to the user$/) do |message|
  @util.verifymessage(message).should eq(true)
end


And(/^I verify that "([^"]*)" field has the "([^"]*)" value edited$/) do |field, value|
  case field
    when 'Pick Up location' then

    when 'Pick Up location on Modify' then
      within(:xpath,".//*[@id='searchForm_pickUpLocation']") do
        has_xpath?(".//input[contains(@value,'#{value}')]")
      end
  end
end

And(/^I set the "([^"]*)" field with "([^"]*)" value and "([^"]*)" value$/) do |field, pdate, ddate|
  @addcarpage.pickdate_field.click
  @util.selectDateFromDatePicker(field, pdate, ddate)
  sleep 10
end

Then(/^I verify the "([^"]*)" title is displayed$/) do |title|
  case title
    when 'My Car Reservation' then
      @modifyreservationpage.has_mycarreservation_title?.should eq(true)
      sleep 3
    else
      fail(ArgumentError.new("'#{title}' title doesn't exist!"))
  end
end

Then(/^I verify the "([^"]*)" field is displayed$/) do |field|
  case field
    when 'Pick Up location' then
      @addcarpage.has_picklocation_labelkh?.should eq(true)
    when 'Rental Dates and Times' then
      @addcarpage.has_pickdate_field?.should eq(true)
    when 'Hertz Gold Plus Member Number' then
      @modifyreservationpage.has_hertzgoldmember_field?.should eq(true)
    when 'Drop Off Location' then
      @modifyreservationpage.has_dropofflocation_field?.should eq(true)
    when 'Promotional Coupon' then
      @modifyreservationpage.has_promotionalcoupon_field?.should eq(true)
    when 'Discount / CDP / Club Code' then
      @modifyreservationpage.has_discountcode_field?.should eq(true)
    else
      fail(ArgumentError.new("'#{field}' field doesn't exist!"))
  end
end

Then(/^I verify the "([^"]*)" checkbox is displayed$/) do |checkbox|
  case checkbox
    when 'Return car to a different location' then
      @modifyreservationpage.has_returnlocation_checkbox?.should eq(true)
    when 'Use a different discount or promo code' then
      @modifyreservationpage.has_promocode_checkbox?.should eq(true)
    else
      fail(ArgumentError.new("'#{checkbox}' checkbox doesn't exist!"))
  end
end

Then(/^I verify the "([^"]*)" bar is displayed$/) do |bar|
  case bar
    when 'VIEW TERMS & CONDITIONS' then
      @util.has_termscondi_bar?.should eq(true)
    else
      fail(ArgumentError.new("'#{bar}' bar doesn't exist!"))
  end
end

And(/^I verify the "([^"]*)" checkbox is unchecked$/) do |checkbox|
  case checkbox
    when 'Return car to a different location' then
      @modifyreservationpage.returnlocation_checkbox.checked?.should eq(false)
    when 'Use a different discount or promo code' then
      @modifyreservationpage.promocode_checkbox.checked?.should eq(false)
    else
      fail(ArgumentError.new("'#{checkbox}'is checked!"))
  end
end

And(/^I verify the "([^"]*)" field has the "([^"]*)" value$/) do |field, value|
  case field
    when 'Hertz Gold Plus Member Number' then
      find(:xpath, ".//*[@id='searchForm_carRentalRewardsNumber']").has_text?(value).should eq(true)
    when 'Car Type' then
      find(:xpath, ".//h4[contains(@class,'SelectedCarWidget-cta')] /span[contains(text(),'Standard')]']").has_text?(value).should eq(true)
  end
end

And(/^I set the "([^"]*)" field with "([^"]*)" value, "([^"]*)" value, "([^"]*)" and "([^"]*)" value, "([^"]*)" value, "([^"]*)"$/) do |field, pmonth, pday, ptime, dmonth, dday, dtime|
  @addcarpage.pickdate_field.click
  @util.selectDateFromDatePicker(field, pmonth, pday, ptime, dmonth, dday, dtime)
  sleep 10
end

And(/^I click on "([^"]*)" bar$/) do |bar|
  case bar
    when 'CHOOSE A DIFFERENT CAR' then
      @util.has_termscondi_bar?.should eq(true)
    else
      fail(ArgumentError.new("'#{bar}' bar doesn't exist!"))
  end
end


And(/^I click on "([^"]*)" bar on "([^"]*)" page$/) do |page, bar|
  case page
    when 'Modify Car Reservation' then
      @util.expandBar(bar)
      sleep 30
  end
end

Then(/^I verify the "([^"]*)" information is displayed$/) do |element|
  @util.verifyElementExists (element)
end

And(/^I set the "([^"]*)" field with "([^"]*)" value,"([^"]*)" value, "([^"]*)" value, "([^"]*)" and "([^"]*)" value,"([^"]*)" value, "([^"]*)" value, "([^"]*)"$/) do |field, pyear, pmonth, pday, ptime, dyear, dmonth, dday, dtime|
  @addcarpage.pickdate_field.click
  @util.selectDateFromDatePicker(field, pyear, pmonth, pday, ptime, dyear, dmonth, dday, dtime)
  sleep 10
end

And(/^I uncheck the "([^"]*)" checkbox$/) do |field|
  @util.setCheckbox(field, false)
  sleep 5
end

Then(/^I verify the "([^"]*)" field is not displayed$/) do |field|
  case field
    when 'Drop Off Location' then
      @modifyreservationpage.has_dropofflocation_field?.should eq(false)
    when 'Promotional Coupon' then
      @modifyreservationpage.has_promotionalcoupon_field?.should eq(false)
    when 'Discount / CDP / Club Code' then
      @modifyreservationpage.has_discountcode_field?.should eq(false)
    else
      fail(ArgumentError.new("'#{field}' field does exist!"))
  end
end

Then(/^I verify the "([^"]*)" button is not displayed$/) do |button|
  case button
    when 'UPDATE DISCOUNT PROMO CODE' then
      @modifyreservationpage.has_promocode_button?.should eq(false)
    else
      puts "'#{button}' button doesn't exist!"
  end
end

And(/^I verify the "([^"]*)" link is displayed$/) do |link|
  case link
    when 'View Hotel Information' then
      @managereservationpage.has_viewhotelinfo_link?.should eq(true)
    else
      fail(ArgumentError.new("'#{link}' link does exist!"))
  end
end

And(/^I verify the "([^"]*)" field has the type value$/) do |field|
  case field
    when 'Car Type' then
      @managereservationpage.has_cartype_info?.should eq(true)
  end
end

Then(/^I verify the "([^"]*)", "([^"]*)" and (.*) are displayed in the "([^"]*)" section$/) do |value1, value2, value3, field|
  case field
    when 'driver info' then
      has_xpath?(".//*[@data-slnm-ihg='firstNameSID' and text()='#{value1}']")
      has_xpath?(".//*[@data-slnm-ihg='lastNameSID' and text()='#{value2}']")
      has_xpath?(".//*[@data-slnm-ihg='emailSID' and text()='#{value3}']")
    else
      fail(ArgumentError.new("driver info does not exist!"))
  end
end

Then(/^I verify the "([^"]*)" are displayed$/) do |arg|
  fail(ArgumentError.new('Billing details not displayed')) if has_no_xpath?(".//*[@class='FormattedCurrency-amount']")
end

