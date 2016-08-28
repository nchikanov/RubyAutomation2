
class BookFlightsPage < SitePrism::Page

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

      when 'Review Your Flight' then

        flightPrices = Array.new
        i = 1
        until has_no_xpath? ".//*[@id='hia-hotel-cards']/li[#{i}]/div/div/span/span[@class='total-price price block _jq-price-with-tooltip _jq-rate-card-price']"
          total_price = find(:xpath, ".//*[@id='hia-hotel-cards']/li[#{i}]/div/div/span/span[@class='total-price price block _jq-price-with-tooltip _jq-rate-card-price']")::text()
          flightPrices.push(total_price)
          i += 1
        end

        flightPrices.each { |price| print price + ' ' }

        #Then need to loop through array to see which one is the cheapest, grab that xpath, and click

    end


  end

  def selectfirstbutton
    if has_xpath? ".//*[@id='flight_card_container']/li/div/a[text()='Select']"
      find('a', text: 'Select', :match => :first).click
    else
      puts "Could not select first 'SUBMIT' button"
    end
  end


end