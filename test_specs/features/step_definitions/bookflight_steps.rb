When(/^I set the What type of flight do you need radio button with "([^"]*)" option$/) do |option|
  @bookflightpage.selectRadioButton(option)
end

And(/^I set the "([^"]*)" fields with "([^"]*)" value and "([^"]*)" value$/) do |element, value1, value2|
  @bookflightpage.set2Values(element, value1, value2)
  sleep 3
end

And(/^I select the "([^"]*)" field with "([^"]*)" and "([^"]*)" value$/) do |field, value1, value2|
  @bookflightpage.set2Values(field, value1, value2)
end