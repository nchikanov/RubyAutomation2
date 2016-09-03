
class BookFlightsPage < SitePrism::Page

  @@hotelHash =  Hash.new { |h,k| h[k] = {} }

 element :departure_airport, :xpath, ".//*[@id='flight_search_flight_search_slices_attributes_0_departure_search_for']"
 element :departure_airport_2, :xpath, ".//*[@id='flight_search_flight_search_slices_attributes_1_departure_search_for']"
 element :departure_airport_3, :xpath, ".//*[@id='flight_search_flight_search_slices_attributes_2_departure_search_for']"
 element :arrival_airport, :xpath, ".//*[@id='flight_search_flight_search_slices_attributes_0_arrival_search_for']"
 element :arrival_airport_2, :xpath, ".//*[@id='flight_search_flight_search_slices_attributes_1_arrival_search_for']"
 element :arrival_airport_3, :xpath, ".//*[@id='flight_search_flight_search_slices_attributes_2_arrival_search_for']"
 element :departure_time, :xpath, ".//*[@id='flight_search_flight_search_slices_attributes_0_departure_hour_range_input']/a/span[1]"
 element :departure_time_2, :xpath, ".//*[@id='flight_search_flight_search_slices_attributes_1_departure_hour_range_input']/a/span[1]"
 element :departure_time_3, :xpath, ".//*[@id='flight_search_flight_search_slices_attributes_2_departure_hour_range_input']/a/span[1]"
 element :return_time, :xpath, ".//*[@id='flight_search_flight_search_slices_attributes_1_departure_hour_range_input']/a"
 element :fare_class, :xpath, ".//*[@id='flight_search_cabin_type_input']/a"
 element :children_combobox, :xpath, ".//*[@id='flight_search_traveler_groups_child_count_input']"
 element :childrenage_combobox1, :xpath, ".//*[@id='new_flight_search']/fieldset[8]/ol/div[2]/fieldset/ol/li[4]/fieldset/div[2]/ol/li[1]"
 element :childrenage_combobox2, :xpath, ".//*[@id='new_flight_search']/fieldset[8]/ol/div[2]/fieldset/ol/li[4]/fieldset/div[2]/ol/li[2]"
 element :childinlap_option, :xpath, ".//*[@id='flight_search_traveler_groups_infants_seated_input']/fieldset/ol/li[1]/span"
 element :childinseat_option, :xpath, ".//*[@id='flight_search_traveler_groups_infants_seated_input']/fieldset/ol/li[2]/span"

 element :pick_up_time, :xpath, ".//*[@id='car_search_start_time_input']/a"
 element :drop_off_time, :xpath, ".//*[@id='car_search_end_time_input']/a"
 element :air_conditioning, :xpath,  ".//*[@id='car_search_air_conditioning_input']/a"
 element :transmission_button, :xpath, ".//*[@id='car_search_transmission_type_input']/a"

 element :departuredate_field, :xpath, ".//*[@id='flight_search_flight_search_slices_attributes_0_departure_date']"
 element :returndate_field, :xpath, ".//*[@id='flight_search_flight_search_slices_attributes_1_departure_date']"

 element :first_name, :xpath, ".//*[@id='cart_passengers_attributes_0_first_name']"
 element :last_name, :xpath, ".//*[@id='cart_passengers_attributes_0_last_name']"
 element :email, :xpath, ".//*[@class='customer-form']/div/div/div/div/ul/li/input[@type='text']"
 element :country_code, :xpath, ".//*[@class='customer-form']/div/div/div/a"
 element :phone_number, :xpath, ".//*[@id='traveler-info-checkout']/div/div/div/fieldset/div/div/div/div/input[@class='required phone-number _jq-traveler-phone-number _jq_mask_input']"
 element :state, :xpath, ".//*[@id='cart_customer_attributes_state_of_residence_input']/a/span[@class='selectBox-arrow']"
 element :gender, :xpath, ".//*[@id='cart_passengers_attributes_0_gender_input']/a/span[@class='selectBox-arrow']"
 element :dob, :xpath, ".//*[@id='cart_passengers_attributes_0_date_of_birth']"

 element :first_name_2, :xpath, ".//*[@id='cart_passengers_attributes_1_first_name']"
 element :last_name_2, :xpath, ".//*[@id='cart_passengers_attributes_1_last_name']"
 element :gender_2, :xpath, ".//*[@id='cart_passengers_attributes_1_gender_input']/a/span[@class='selectBox-arrow']"
 element :dob_2, :xpath, ".//*[@id='cart_passengers_attributes_1_date_of_birth']"

 element :first_name_3, :xpath, ".//*[@id='cart_passengers_attributes_2_first_name']"
 element :last_name_3, :xpath, ".//*[@id='cart_passengers_attributes_2_last_name']"
 element :gender_3, :xpath, ".//*[@id='cart_passengers_attributes_2_gender_input']/a/span[@class='selectBox-arrow']"
 element :dob_3, :xpath, ".//*[@id='cart_passengers_attributes_2_date_of_birth']"

 element :card_type, :xpath, ".//*[@id='cart_customer_attributes_credit_card_attributes_type_input']/a"
 element :card_number, :xpath, ".//*[@id='paymodule-pay-with-any-card']/div/div/fieldset/input[@type='text']"
 element :cid, :xpath, ".//*[@id='cart_customer_attributes_credit_card_attributes_verification_number']"
 element :exp_month, :xpath, ".//*[@id='cart_customer_attributes_credit_card_attributes_exp_month_input']/a/span[@class='selectBox-arrow']"
 element :exp_year, :xpath, ".//*[@id='cart_customer_attributes_credit_card_attributes_exp_year_input']/a/span[@class='selectBox-arrow']"
 element :cardholder_name, :xpath, ".//*[@id='cart_customer_attributes_credit_card_attributes_cardholder_name']"
 element :country, :xpath, ".//*[@id='cart_customer_attributes_country_code_input']/a/span[@class='selectBox-arrow']"
 element :street_address, :xpath, ".//*[@id='cart_customer_attributes_address1']"
 element :town, :xpath, ".//*[@id='cart_customer_attributes_city']"
 element :state_2, :xpath, ".//*[@id='cart_customer_attributes_state_province_code_input']/a/span[@class='selectBox-arrow']"
 element :zip_code, :xpath, ".//*[@id='cart_customer_attributes_postal_code']"
 element :phone_code, :xpath, ".//*[@id='paymodule-pay-with-any-card']/div/fieldset/div/a"
 element :phone_number_2, :xpath, ".//*[@id='paymodule-pay-with-any-card']/div/fieldset/div/input[@class='phone-number _billing_phone phone _jq-traveler-phone-number _jq_mask_input required']"

  element :hotel_cards_umbrella, :xpath, ".//*[@id='hia-hotel-cards']"

  @@addHotelToFlightContainer = ".product-results"

  def scrollWidgetUntilElementFound(widget, xpathElement)
    idWidget = case widget
                 when 'Add Hotel to Flight' then
                   '.product-results'
               end
    outerHeight = page.execute_script("return $('#{idWidget}').outerHeight();")
    scrollHeight = page.execute_script("return $('#{idWidget}').get(0).scrollHeight;")
    scrollTop = page.execute_script("return $('#{idWidget}').scrollTop();")

    y = 400
    contentFound = has_xpath?(xpathElement)
    while ((scrollTop+outerHeight) < scrollHeight) and !contentFound do
      page.execute_script("$('#{idWidget}').scrollTop(#{y})")
      scrollTop = page.execute_script("return $('#{idWidget}').scrollTop();")
      within(idWidget) do
        contentFound = has_xpath?(xpathElement)
      end
      y += 400
    end
  end

  def addHotelInfo(info, data)
    @@hotelHash['Hotel'][info] = data
  end

  def getHotelInfo(info)
    puts @@hotelHash['Hotel'][info]
  end

  def findCheapestHotel
    #View all hotels
    find(:xpath, ".//*[@class='product-results']/button[text()='View all hotels']").click

    i = 2
    #first hotel they suggest, used to compare to others :)
    lowest_cost = find(:xpath, ".//*[@id='hia-hotel-cards']/li[1]/div/div/span/span[@class='total-price price block _jq-price-with-tooltip _jq-rate-card-price']")::text()
    #Gets rid of any characters that aren't numeric
    lowest_cost2 = lowest_cost.gsub(/[^0-9]/, "")

    while has_xpath?".//*[@id='hia-hotel-cards']/li[#{i}]/div/div/span/span[@class='total-price price block _jq-price-with-tooltip _jq-rate-card-price']"
      total_cost = find(:xpath, ".//*[@id='hia-hotel-cards']/li[#{i}]/div/div/span/span[@class='total-price price block _jq-price-with-tooltip _jq-rate-card-price']")::text()
      total_cost2 = total_cost.gsub(/[^0-9]/, "")

      if total_cost2.to_i < lowest_cost2.to_i
        lowest_cost2 = total_cost2
        tempIndex = i
      end

      i = i + 1

      #hotel_path = ".//*[@id='hia-hotel-cards']/li[#{i}]/div/div/span/span[@class='total-price price block _jq-price-with-tooltip _jq-rate-card-price']"
      #if has_no_xpath? hotel_path
       # scrollWidgetUntilElementFound('Add Hotel to Flight', hotel_path)
      #end


    end

      puts 'Index of lowest price is: ' + tempIndex.to_s
      puts 'There are ' + (i-1).to_s + ' xpaths that I shuffled through'

      low = find(:xpath, ".//*[@id='hia-hotel-cards']/li[#{tempIndex}]/div/div/span/span[@class='total-price price block _jq-price-with-tooltip _jq-rate-card-price']")::text()
      puts 'Lowest cost of hotel: ' + low.to_s

    #Select Lowest Hotel to add
    find(:xpath, ".//*[@id='hia-hotel-cards']/li[#{tempIndex}]/div/a[@class='select-button _jq-hotel-select-button']").click


  end


   def selectItemInAutosuggest(autosuggestName, item)
     case autosuggestName
       when 'airport1' then
         find(:xpath, "html/body/ul/li/a[contains(text(), '#{item}')]").click
       when 'airport2' then
         find(:xpath, "html/body/ul/li/a[contains(text(), '#{item}')]").click
       when 'dept time' then
         find(:xpath, "html/body/ul/li/a[text()='#{item}']").click
       when 'ret time' then
         find(:xpath, "html/body/ul/li/a[text()='#{item}']").click
       when 'fare class' then
         find(:xpath, "html/body/ul[18]/li/a[text()='#{item}']").click
       else
         fail(ArgumentError.new("'#{item}' does not exist!"))
     end
   end

 def setValue(element, value)
   case element
     when 'When are you going' then
       departure_time.click
       selectItemInAutosuggest('dept time', value)

     when 'Where and when are you going' then
       departure_time.click

       selectItemInAutosuggest('dept time', value)

     when 'Where and when are you going_2' then
       departure_time_2.click
       
        selectItemInAutosuggest('dept time', value)

     when 'Where and when are you going_3' then
       departure_time_3.click

        selectItemInAutosuggest('dept time', value)

     when 'When are you going Departure' then
       departuredate_field.click
       departuredate_field.set(value)

     when 'When are you going Return' then
       returndate_field.click
       returndate_field.set(value)

     else
       fail(ArgumentError.new("'#{value}' does not exist!"))

   end



 end

  def set2values(element, value1, value2)
    case element
      when 'Where are you going' then
        departure_airport.click
        departure_airport.set value1
        selectItemInAutosuggest('airport1', value1)

        arrival_airport.click
        arrival_airport.set value2
        selectItemInAutosuggest('airport2', value2)

      when 'When are you going' then
        departure_time.click
        selectItemInAutosuggest('dept time', value1)

        return_time.click
        selectItemInAutosuggest('ret time', value2)

      when 'Where and when are you going' then
        ###Flight 1###

        departure_airport.click
        departure_airport.set value1


        selectItemInAutosuggest('airport1', value1)


        arrival_airport.click
        arrival_airport.set value2

        selectItemInAutosuggest('airport2', value2)


      when 'Where and when are you going_2' then
        ###Flight 2###

        departure_airport_2.click
        departure_airport_2.set value1

        selectItemInAutosuggest('airport1', value1)


        arrival_airport_2.click
        arrival_airport_2.set value2

        selectItemInAutosuggest('airport2', value2)


      when 'Where and when are you going_3' then
        ###Flight 3###
        departure_airport_3.click
        departure_airport_3.set value1

        selectItemInAutosuggest('airport1', value1)


        arrival_airport_3.click
        arrival_airport_3.set value2

        selectItemInAutosuggest('airport2', value2)


      when 'Children Age' then
        if value1 == 'child in lap'
          childrenage_combobox1.click
          #find(:xpath, "html/body/ul[10]/li[1]/a").click
          within childrenage_combobox1 do
            childinlap_option.click
          end

          if value2 == 'child in seat'
            childrenage_combobox2.click
            #find(:xpath, "html/body/ul[11]/li[1]/a").click
            within childrenage_combobox2 do
              childinseat_option.click
              end

          end
        end

      when 'Car Rental Time' then
        pick_up_time.click
        find(:xpath, "html/body/ul[5]/li/a[text()='#{value1}']").click

        drop_off_time.click
        find(:xpath, "html/body/ul[6]/li/a[text()='#{value2}']").click

      when 'Do you have any specific preferences' then
        air_conditioning.click
        find(:xpath, "html/body/ul[8]/li/a[text()='#{value1}']").click

        transmission_button.click
        find(:xpath, "html/body/ul[9]/li/a[text()='#{value2}']").click


      else
        fail(ArgumentError.new("'#{value1}' does not exist!"))

    end

  end

  def selectlowestprice(page)
    case page
      when 'Flex' then
        if has_xpath? ".//*[@class='lowest-price']/a"
          #find('a', :match => :first).click
          first('.lowest-price > a').click
        else
          puts "Could not select lowest price in flex matrix"
        end


    end


  end

  def selectfirstbutton
    if has_xpath? ".//*[@id='flight_card_container']/li/div/a[text()='Select']"
      find('a', text: 'Select', :match => :first).click
    else
      puts "Could not select first 'SUBMIT' button"
    end
  end

  def fillValue(field, value)
    case field

      ##TRAVELER INFORMATION

      when 'First Name' then
        first_name.set value
      when 'Last Name' then
        last_name.set value
      when 'Email' then
        email.set value
      when 'Country Code' then
        country_code.click
        find(:xpath, "html/body/ul[1]/li/a[text()='#{value}']").click
      when 'Phone Number' then
        phone_number.click
        phone_number.send_keys(value)
      when 'State of Residence' then
        state.click
        find(:xpath, "html/body/ul/li/a[@rel='#{value}']").click
      when 'Gender' then
        gender.click
        find(:xpath, "html/body/ul[3]/li/a[@rel='#{value}']").click
      when 'DOB' then
        dob.click
        dob.send_keys(value)

      when 'First Name 2' then
        first_name_2.set value
      when 'Last Name 2' then
        last_name_2.set value
      when 'Gender 2' then
        gender_2.click
        find(:xpath, "html/body/ul[6]/li/a[@rel='#{value}']").click
      when 'DOB 2' then
        dob_2.click
        dob_2.send_keys(value)

      when 'First Name 3' then
        first_name_3.set value
      when 'Last Name 3' then
        last_name_3.set value
      when 'Gender 3' then
        gender_3.click
        find(:xpath, "html/body/ul[9]/li/a[@rel='#{value}']").click
      when 'DOB 3' then
        dob_3.click
        dob_3.send_keys(value)

        ##PAYMENT INFORMATION
      when 'Card Type' then
        card_type.click
        find(:xpath, "html/body/ul/li/a[text()='#{value}']").click
      when 'Card Number' then
        card_number.set value
      when 'CID' then
        cid.set value
      when 'Exp. Month' then
        exp_month.click
        find(:xpath, "html/body/ul/li/a[@rel='#{value}']").click
      when 'Exp. Year' then
        exp_year.click
        find(:xpath, "html/body/ul/li/a[text()='#{value}']").click
      when 'Cardholder Name' then
        cardholder_name.set value
      when 'Country' then
        country.click
        find(:xpath, "html/body/ul/li/a[text()='#{value}']").click
      when 'Street Address' then
        street_address.set value
      when 'Town' then
        town.set value
      when 'State' then
        state_2.click
        find(:xpath, "html/body/ul/li/a[@rel='#{value}']").click
      when 'Zip Code' then
        zip_code.set value
      when 'Country Phone Code' then
        phone_code.click
        find(:xpath, "html/body/ul[16]/li/a[text()='#{value}']").click
      when 'Phone Number 2' then
        phone_number_2.click
        phone_number_2.send_keys(value)


    end
  end



end