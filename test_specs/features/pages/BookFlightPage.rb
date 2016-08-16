require 'capybara/rspec'
require 'selenium-webdriver'

class BookFlightPage < SitePrism::Page
  # set_url $url_login

  #FlightType Radio buttons
  element :roundtrip_radiobutton, :xpath, ".//*[@id='flight_search_trip_type_input']/fieldset/ol/li[1]/label/span"
  element :oneway_radiobutton, :xpath, ".//*[@id='flight_search_trip_type_input']/fieldset/ol/li[2]/label/span"
  element :multicity_radiobutton, :xpath,".//*[@id='flight_search_trip_type_input']/fieldset/ol/li[3]/label/span"
  element :departure_field, :xpath, ".//*[@id='flight_search_flight_search_slices_attributes_0_departure_search_for']"
  element :arrival_field, :xpath, ".//*[@id='flight_search_flight_search_slices_attributes_0_arrival_search_for']"
  element :departuredate_field, :xpath, ".//*[@id='flight_search_flight_search_slices_attributes_0_departure_date']"
  element :returndate_field, :xpath, ".//*[@id='flight_search_flight_search_slices_attributes_1_departure_date']"
  element :searchflights_button, :xpath, ".//*[@class='buttoncommit special-air-commit create']"
  element :adults_combobox, :xpath, ".//*[@id='flight_search_traveler_groups_adults_input']/a/span[2]"
  element :adultsexp_combobox, :xpath, ".//*[@id='flight_search_traveler_groups_adults_input']"

  # .//*[@id='flight_search_traveler_attributes_adults']/option[@value="1"]
  element :children_combobox, :xpath, ".//*[@id='flight_search_traveler_groups_child_count_input']"
  element :childrenage_combobox, :xpath,".//*[@id='flight_search_traveler_groups_child_age_input']/a"
  element :childinseat_option, :xpath, ".//*[@id='flight_search_traveler_groups_infants_seated_input']/fieldset/ol/li[2]/span"
  element :childinlap_option, :xpath, ".//*[@id='flight_search_traveler_groups_infants_seated_input']/fieldset/ol/li[1]/span"
  element :login_button, :xpath,".//*[@class='login-button']"
  element :userid_field, :xpath, ".//*[@id='userId']"
  element :userpass_field, :xpath, ".//*[@id='password']"
  element :userlogin_button, :xpath, ".//*[@id='login']/div"


  element :picktime, :xpath,".//div[contains(@class,'TimePicker TimePicker--wide')]"
  element :firstname_field, :xpath,".//*[@id='driverInformationForm_firstName']"
  element :lastname_field, :xpath,".//*[@id='driverInformationForm_lastName']"
  element :emailaddress_field, :xpath,".//*[@id='driverInformationForm_emailAddress']"
  element :booknow_button, :xpath,".//*[@id='driverInformationForm_submitBtn']"
  # element :booknow_button, '#driverInformationForm_submitBtn'
  element :cancelbook_button, :xpath, "//button[contains(@type,'button')and text()='CANCEL RESERVATION']"
  element :selectcarform, :xpath, ".//div[@class='DriverInformationForm']"
  # ".//*[@id='driverInformationForm_submitBtn']"
  # "//button[contains(@type,'submit')and text()='Book Now']"
  element :hertzmember_field, :xpath, ".//*[@data-slnm-ihg='IHGRewardsNumberInputSID']"
  element :selectacar_button, :xpath, ".//button[@data-slnm-ihg='addToMyStayButtonSID']"
  element :picklocation_labelkh, :xpath, ".//label/span[text() = 'Pick Up Location']"


  def selectRadioButton(option)
    case option
      ###Flight Type###
      when 'Round Trip' then
        roundtrip_radiobutton.click
      when 'One Way' then
        oneway_radiobutton.click
      when 'Multi-City' then
        multicity_radiobutton.click
      else "The '#{option}' was not found."
    end
  end

  def set2Values(element, value1, value2)
    case element
      when 'Where are you going' then
        departure_field.click
        departure_field.set value1
          departureXpath = ".//ul/li[@class='ui-menu-item']/a[text()='#{value1}']"
          result = false
          waitTime = Time.now + 10
          while Time.now < waitTime and !result do
            result = has_xpath?(departureXpath)
          end
          find(:xpath, departureXpath).click
        arrival_field.click
        arrival_field.set value2
        arrivalXpath = ".//ul/li[@class='ui-menu-item']/a[text()='#{value2}']"
        result = false
        waitTime = Time.now + 10
        while Time.now < waitTime and !result do
          result = has_xpath?(arrivalXpath)
        end
        find(:xpath, arrivalXpath).click
      when 'How many travelers' then
        adults_combobox.click
        page.execute_script('')

      # within '#flight_search_traveler_group_attributes_adults' do
        #   find("option[value='2']").click
        #

          # find("option[value='#{value1}']").click

          # within '#date' do
          #   find("option[value='20120905']").click
          #  end

          # find(:xpath, ".//ul/li/a[@rel='#{value1}']").select_option
        # end
         # within adults_combobox do
         #   page.driver.browser.action.send_keys('2')
         #   page.driver.browser.action.send_keys :enter

         #   find(:xpath, 'html/body/ul[7]').click
         # find(:xpath, ".//ul/li/a[@rel='#{value1}']").click
         #      # .//ul/li/a[@rel='#{value1}']
         # end
        # children_combobox.click
        # page.driver.browser.action.send_keys('2')
        # page.driver.browser.action.send_keys :enter
        # within children_combobox do
        #   find(:xpath, ".//ul/li/a[@rel='#{value2}']").click
        # end
      when 'Children Age' then
        if value1 == 'child In lap'
          childrenage_combobox.click
          within children_combobox do
            find(:xpath, ".//ul/li/a[@rel='0']").click
            childinlap_option.click
          end
          if value2 == 'child In seat'
            childrenage_combobox.click
            within children_combobox do
              find(:xpath, ".//ul/li/a[@rel='1']").click
              childinseat_option.click
              end
        end
         else
        fail(ArgumentError.new("'#{value1}' does not exist!"))
      end
    end
  end
  def fillValue(field, value)
    case field
      when 'Username' then
        userid_field.set value
      when 'Password' then
        userpass_field.set value
      else
        fail(ArgumentError.new("FIELD #{field} WAS NOT FOUND!"))
    end
  end
  def clickButton(button)
    case button
      when 'Search Flights' then
        searchflights_button.click
      when 'Login' then
        login_button.click
      when 'LOGIN' then
        userlogin_button.click
      else
        fail(ArgumentError.new("BUTTON #{button} WAS NOT FOUND!"))
    end
  end
  def refreshPage
    visit(current_url)
  end
  def setValue(field, value)
    case field
      when 'When are you going Departure' then
        departuredate_field.click
        departuredate_field.set(value)
      when 'When are you going Return' then
        returndate_field.click
        returndate_field.set(value)
      else
        fail(ArgumentError.new("'#{element}' does not exist!"))
     end
  end
end
