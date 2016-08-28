
class BookCarsPage < SitePrism::Page

  element :car_pickup, :xpath, ".//*[@id='pick_up']"
  element :car_pickup_time, :xpath, ".//*[@id='car_search_start_time_input']/a"
  element :car_dropoff_time, :xpath, ".//*[@id='car_search_end_time_input']/a"
  element :aircon, :xpath, ".//*[@id='car_search_air_conditioning_input']/a"
  element :transmission, :xpath, ".//*[@id='car_search_transmission_type_input']/a"
  element :first_name, :xpath, ".//*[@id='cart_driver_attributes_first_name']"
  element :last_name, :xpath, ".//*[@id='cart_driver_attributes_last_name']"
  element :email, :xpath, ".//*[@id='_jq-form-who-is-driving']/fieldset/ul/li/input[@class='required email _jq-cheetah-email _jq_mask_input']"
  element :phone_number, :xpath, ".//*[@class='required phone-number _jq-traveler-phone-number _jq_mask_input']"
  element :country_code_dropdown, :xpath, ".//*[@id='_jq-form-who-is-driving']/fieldset/div/a[@class='selectBox phone-country-code _jq-traveler-phone-country-code required selectBox-dropdown']"

  def selectItemInAutosuggest(autosuggestName, item)
    case autosuggestName
      when 'car pickup' then
        find(:xpath, "html/body/ul[10]/li/a[text()='#{item}']").click
      when 'car rental company' then
        find(:xpath, "html/body/ul[7]/li/a[text()='#{item}']").click
    end
  end

  def setValue(field, value)
    case field
      when 'Where will you pick up the car' then
        car_pickup.click
        car_pickup.set value
    end
  end

  def set2values(field, value1, value2)
    case field
      when 'Car Rental Time' then
        car_pickup_time.click
        find(:xpath, "html/body/ul[5]/li/a[text()='#{value1}']").click

        car_dropoff_time.click
        find(:xpath, "html/body/ul[6]/li/a[text()='#{value2}']").click

      when 'Do you have any specific preferences' then
        aircon.click
        find(:xpath, "html/body/ul[8]/li/a[text()='#{value1}']").click

        transmission.click
        find(:xpath, "html/body/ul[9]/li/a[text()='Automatic']").click

    end
  end

  def fillValue(field, value)
    case field
      when 'First Name' then
        first_name.set value
      when 'Last Name' then
        last_name.set value
      when 'Email' then
        email.set value
      when 'Phone Number Car' then
        phone_number.click
        phone_number.send_keys(value)
        #phone_number.set value


      when 'Country Code Car' then
        country_code_dropdown.click
        find(:xpath, "html/body/ul/li/a[text()='#{value}']").click

    end
  end

end
