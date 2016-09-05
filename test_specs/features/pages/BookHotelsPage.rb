class BookHotelsPage < SitePrism::Page

  element :hotel_search, :xpath, ".//*[@id='hotel_search_location_name']"
  element :rooms, :xpath, ".//*[@id='hotel_search_num_rooms_input']/a"
  element :num_adults, :xpath, ".//*[@id='hotel_search_hotel_search_rooms_attributes_0_number_adults_input']/a"
  element :num_adults_2room, :xpath, ".//*[@id='hotel_search_hotel_search_rooms_attributes_1_number_adults_input']/a"
  element :num_adults_3room, :xpath, ".//*[@id='hotel_search_hotel_search_rooms_attributes_2_number_adults_input']/a"
  element :num_adults_4room, :xpath, ".//*[@id='hotel_search_hotel_search_rooms_attributes_3_number_adults_input']/a"
  element :num_kids, :xpath, ".//*[@id='hotel_search_hotel_search_rooms_attributes_0_number_children_input']/a"
  element :num_kids_2room, :xpath, ".//*[@id='hotel_search_hotel_search_rooms_attributes_1_number_children_input']/a"
  element :num_kids_3room, :xpath, ".//*[@id='hotel_search_hotel_search_rooms_attributes_2_number_children_input']/a"
  element :num_kids_4room, :xpath, ".//*[@id='hotel_search_hotel_search_rooms_attributes_3_number_children_input']/a"
  element :child_age_1, :xpath, ".//*[@id='hotel_search_hotel_search_rooms_attributes_0_child_ages_1_age_input']/a"
  element :child_age_1_2room, :xpath, ".//*[@id='hotel_search_hotel_search_rooms_attributes_1_child_ages_1_age_input']/a"
  element :child_age_1_3room, :xpath, ".//*[@id='hotel_search_hotel_search_rooms_attributes_2_child_ages_1_age_input']/a"
  element :child_age_1_4room, :xpath, ".//*[@id='hotel_search_hotel_search_rooms_attributes_3_child_ages_1_age_input']/a"
  element :child_age_2, :xpath, ".//*[@id='hotel_search_hotel_search_rooms_attributes_0_child_ages_2_age_input']/a"
  element :child_age_2_2room, :xpath, ".//*[@id='hotel_search_hotel_search_rooms_attributes_1_child_ages_2_age_input']/a"
  element :child_age_2_3room, :xpath, ".//*[@id='hotel_search_hotel_search_rooms_attributes_2_child_ages_2_age_input']/a"
  element :child_age_2_4room, :xpath, ".//*[@id='hotel_search_hotel_search_rooms_attributes_3_child_ages_2_age_input']/a"

  element :first_name1, :xpath, ".//*[@id='fName']"
  element :last_name1, :xpath, ".//*[@id='lName']"
  element :email, :xpath, ".//*[@id='email']"
  element :country_code, :xpath, ".//*[@class='Select']/button[@class='Select-dropDownBtn']"
  element :traveler_info, :xpath, ".//*[@class='TravelerInformationContainer']"
  element :phone_number, :xpath, ".//*[@class='PlaceheldInput isFilled PlaceheldInput--noBorderLeft']/input[@id='phone']"
  element :first_name2, :xpath, ".//*[@id='addRoom-fname2']"
  element :last_name2, :xpath, ".//*[@id='addRoom-lname2']"
  element :first_name3, :xpath, ".//*[@id='addRoom-fname3']"
  element :last_name3, :xpath, ".//*[@id='addRoom-lname3']"
  element :first_name4, :xpath, ".//*[@id='addRoom-fname4']"
  element :last_name4, :xpath, ".//*[@id='addRoom-lname4']"

  element :name_on_card, :xpath, ".//*[@id='cardInfo_nameOnCard']"
  element :card_type, :xpath, ".//*[@class='NewCardInformation-cardInfo']/div/div/div/div/div[@class='Select-value']"
  element :card_number, :xpath, ".//*[@id='cardInfo_cardNumber']"
  element :exp_month, :xpath, ".//*[@id='cardInfo_expMonth']"
  element :exp_year, :xpath, ".//*[@id='cardInfo_expYear']"
  element :cid, :xpath, ".//*[@id='cardInfo_cid']"
  element :street_address, :xpath, ".//*[@id='billingInfo_address1']"
  element :country, :xpath, ".//*[@class='NewCardInformation-billingInfo']/div/div/div/button[@class='Select-dropDownBtn']"
  element :country_code_pay, :xpath, ".//*[@class='FormRow-colHalf']/div/button[@class='Select-dropDownBtn']"
  element :zip_code, :xpath, ".//*[@id='billingInfo_zip']"
  element :town, :xpath, ".//*[@id='billingInfo_town']"
  element :umbrella_country, :xpath, ".//*[@class='FormRow-colHalf']"
  element :state, :xpath, ".//*[@class='NewCardInformation']/div/div/div/div/div/div/div/div[text()='*State']"
  element :new_card_info, :xpath, ".//*[@class='NewCardInformation']"



  def setvalue(field, value)
    case field
      when 'Where are you going Hotel' then
        hotel_search.click
        hotel_search.set value
        find(:xpath, "html/body/ul/li/a[text()='#{value}']").click

      when 'Children Age Hotel' then
        child_age_1.click
        find(:xpath, "html/body/ul[5]/li/a[text()='#{value}']").click

      when 'Chidren Age Hotel 2' then
        child_age_1.click
        find(:xpath, "html/body/ul[5]/li/a[text()='#{value}']").click

        child_age_1_2room.click
        find(:xpath, "html/body/ul[12]/li/a[text()='#{value}']").click

      when 'Children Age Hotel 3' then
        child_age_1.click
        find(:xpath, "html/body/ul[5]/li/a[text()='#{value}']").click

        child_age_1_2room.click
        find(:xpath, "html/body/ul[12]/li/a[text()='#{value}']").click

        child_age_1_3room.click
        find(:xpath, "html/body/ul[19]/li/a[text()='#{value}']").click

      when 'Children Age Hotel 4' then
        child_age_1.click
        find(:xpath, "html/body/ul[5]/li/a[text()='#{value}']").click

        child_age_1_2room.click
        find(:xpath, "html/body/ul[12]/li/a[text()='#{value}']").click

        child_age_1_3room.click
        find(:xpath, "html/body/ul[19]/li/a[text()='#{value}']").click

        child_age_1_4room.click
        find(:xpath, "html/body/ul[26]/li/a[text()='#{value}']").click
    end
  end

  def set2values(field, value1, value2)
    case field
      when 'Children Age Hotel' then
        child_age_1.click
        find(:xpath, "html/body/ul[5]/li/a[text()='#{value1}']").click

        child_age_2.click
        find(:xpath, "html/body/ul[6]/li/a[text()='#{value2}']").click

      when 'Children Age Hotel 2' then
        child_age_1.click
        find(:xpath, "html/body/ul[5]/li/a[text()='#{value1}']").click
        child_age_2.click
        find(:xpath, "html/body/ul[6]/li/a[text()='#{value2}']").click

        child_age_1_2room.click
        find(:xpath, "html/body/ul[12]/li/a[text()='#{value1}']").click
        child_age_2_2room.click
        find(:xpath, "html/body/ul[13]/li/a[text()='#{value2}']").click

      when 'Children Age Hotel 3' then
        child_age_1.click
        find(:xpath, "html/body/ul[5]/li/a[text()='#{value1}']").click
        child_age_2.click
        find(:xpath, "html/body/ul[6]/li/a[text()='#{value2}']").click

        child_age_1_2room.click
        find(:xpath, "html/body/ul[12]/li/a[text()='#{value1}']").click
        child_age_2_2room.click
        find(:xpath, "html/body/ul[13]/li/a[text()='#{value2}']").click

        child_age_1_3room.click
        find(:xpath, "html/body/ul[19]/li/a[text()='#{value1}']").click
        child_age_2_3room.click
        find(:xpath, "html/body/ul[20]/li/a[text()='#{value2}']").click

      when 'Children Age Hotel 4' then
        child_age_1.click
        find(:xpath, "html/body/ul[5]/li/a[text()='#{value1}']").click
        child_age_2.click
        find(:xpath, "html/body/ul[6]/li/a[text()='#{value2}']").click

        child_age_1_2room.click
        find(:xpath, "html/body/ul[12]/li/a[text()='#{value1}']").click
        child_age_2_2room.click
        find(:xpath, "html/body/ul[13]/li/a[text()='#{value2}']").click

        child_age_1_3room.click
        find(:xpath, "html/body/ul[19]/li/a[text()='#{value1}']").click
        child_age_2_3room.click
        find(:xpath, "html/body/ul[20]/li/a[text()='#{value2}']").click

        child_age_1_4room.click
        find(:xpath, "html/body/ul[26]/li/a[text()='#{value1}']").click
        child_age_2_4room.click
        find(:xpath, "html/body/ul[27]/li/a[text()='#{value2}']").click

    end
  end

  def set3values(field, value1, value2, value3)
    case field
      when 'How many rooms and guests' then
        if (value1 == '1') #number of hotel rooms
          rooms.click
          find(:xpath, "html/body/ul[2]/li/a[text()='#{value1}']").click

          num_adults.click
          find(:xpath, "html/body/ul[3]/li/a[text()='#{value2}']").click

          num_kids.click
          find(:xpath, "html/body/ul[4]/li/a[text()='#{value3}']").click
        elsif (value1 == '2')
          rooms.click
          find(:xpath, "html/body/ul[2]/li/a[text()='#{value1}']").click

          ##1st room##
          num_adults.click
          find(:xpath, "html/body/ul[3]/li/a[text()='#{value2}']").click

          num_kids.click
          find(:xpath, "html/body/ul[4]/li/a[text()='#{value3}']").click

          ##2nd room##
          #num_adults_2room.click
          find(:xpath, ".//*[@id='hotel_search_hotel_search_rooms_attributes_1_number_adults_input']/a").click
          find(:xpath, "html/body/ul[10]/li/a[text()='#{value2}']").click

          #num_kids_2room.click
          find(:xpath, ".//*[@id='hotel_search_hotel_search_rooms_attributes_1_number_children_input']/a").click
          find(:xpath, "html/body/ul[11]/li/a[text()='#{value3}']").click

        elsif (value1 == '3')
          rooms.click
          find(:xpath, "html/body/ul[2]/li/a[text()='#{value1}']").click

          ##1st room##
          num_adults.click
          find(:xpath, "html/body/ul[3]/li/a[text()='#{value2}']").click

          num_kids.click
          find(:xpath, "html/body/ul[4]/li/a[text()='#{value3}']").click

          ##2nd room##
          #num_adults_2room.click
          find(:xpath, ".//*[@id='hotel_search_hotel_search_rooms_attributes_1_number_adults_input']/a").click
          find(:xpath, "html/body/ul[10]/li/a[text()='#{value2}']").click

          #num_kids_2room.click
          find(:xpath, ".//*[@id='hotel_search_hotel_search_rooms_attributes_1_number_children_input']/a").click
          find(:xpath, "html/body/ul[11]/li/a[text()='#{value3}']").click

          ##3rd room##
          num_adults_3room.click
          find(:xpath, "html/body/ul[17]/li/a[text()='#{value2}']").click

          num_kids_3room.click
          find(:xpath, "html/body/ul[18]/li/a[text()='#{value3}']").click

        elsif (value1 == '4')
          rooms.click
          find(:xpath, "html/body/ul[2]/li/a[text()='#{value1}']").click

          ##1st room##
          num_adults.click
          find(:xpath, "html/body/ul[3]/li/a[text()='#{value2}']").click

          num_kids.click
          find(:xpath, "html/body/ul[4]/li/a[text()='#{value3}']").click

          ##2nd room##
          #num_adults_2room.click
          find(:xpath, ".//*[@id='hotel_search_hotel_search_rooms_attributes_1_number_adults_input']/a/span[@class='selectBox-arrow']").click
          find(:xpath, "html/body/ul[10]/li/a[text()='#{value2}']").click

          #num_kids_2room.click
          find(:xpath, ".//*[@id='hotel_search_hotel_search_rooms_attributes_1_number_children_input']/a/span[@class='selectBox-arrow']").click
          find(:xpath, "html/body/ul[11]/li/a[text()='#{value3}']").click

          ##3rd room##
          num_adults_3room.click
          find(:xpath, "html/body/ul[17]/li/a[text()='#{value2}']").click

          num_kids_3room.click
          find(:xpath, "html/body/ul[18]/li/a[text()='#{value3}']").click

          ##4th room##
          num_adults_4room.click
          find(:xpath, "html/body/ul[24]/li/a[text()='#{value2}']").click

          num_kids_4room.click
          find(:xpath, "html/body/ul[25]/li/a[text()='#{value3}']").click

        else
          puts "Invalid number of rooms inputted!"

        end

    end
  end

  def selectfirstbutton(page)
    case page
      when 'Book Hotel' then
        if has_xpath? ".//*[@class='ng-pristine ng-valid']/div/button[text()='Book']"
          find('button', text: 'Book', :match => :first).click
        else
          puts "Could not select first 'BOOK' button"
        end

      when 'Select best value hotel' then
        if has_xpath? ".//*[@id='list-view']/li/div/div/a[contains(text(),'Select')]"
          #first('.list-view > a').click
          find('a', text: 'Select', :match => :first).click
        else
          puts "Could not select best value hotel"
        end

    end

  end

  def fillValue(field, value)
    case field
      when 'First Name 1' then
        first_name1.set value
      when 'Last Name 1' then
        last_name1.set value
      when 'First Name 2' then
        first_name2.set value
      when 'Last Name 2' then
        last_name2.set value
      when 'First Name 3' then
        first_name3.set value
      when 'Last Name 3' then
        last_name3.set value
      when 'First Name 4' then
        first_name4.set value
      when 'Last Name 4' then
        last_name4.set value
      when 'Email' then
        email.set value
      when 'Country Code Travel' then
        country_code.click
        find(:xpath, ".//*[@class='Select-options']/div[text()='#{value}']").click
      when 'Country Code Payment' then
        country_code_pay.click

        find(:xpath, ".//*[@class='FormRow-colHalf']/div/div/div/div[text()='#{value}']").click

      when 'Phone Number Travel' then
        within traveler_info do
          #phone_number.click
          phone_number.send_keys(value.reverse)
        end
      when 'Phone Number Payment' then
        within new_card_info do
          #phone_number.click
          phone_number.send_keys(value.reverse)
        end

      when 'Name on card' then
        name_on_card.set value
      when 'Card Type' then
        card_type.click
        find(:xpath, ".//*[@class='NewCardInformation-cardInfo']/div/div/div/div/div/div[text()='#{value}']").click


      when 'Card Number' then
        card_number.set value
      when 'Exp. Month' then
        exp_month.set value
      when 'Exp. Year' then
        exp_year.set value
      when 'CID' then
        cid.set value
      when 'Street Address' then
        street_address.set value
      when 'Country' then
        country.click
        find(:xpath, ".//*[@class='Select-options']/div[text()='#{value}']").click
      when 'Zip Code' then
        zip_code.set value
      when 'Town' then
        town.set value

      when 'State' then
        state.click
        find(:xpath, ".//*[@class='FormRow-colShort']/div/div/div/div[text()='#{value}']").click

    end
  end


  def scrollWidgetUntilElementFound(widget, xpathElement)
    idWidget = case widget
                 when 'Card Type Hotel Payment Info' then
                   '.NewCardInformation-cardInfo'
                   #'.App-mainContent'
               end
    outerHeight = page.execute_script("return $('#{idWidget}').outerHeight()")
    scrollHeight = page.execute_script("return $('#{idWidget}').get(0).scrollHeight")
    scrollTop = page.execute_script("return $('#{idWidget}').scrollTop()")

    y = 400
    contentFound = has_xpath?(xpathElement)
    while ((scrollTop+outerHeight) < scrollHeight) and !contentFound do
      page.execute_script("$('#{idWidget}').scrollTop(#{y})")
      scrollTop = page.execute_script("return $('#{idWidget}').scrollTop()")
      within(idWidget) do
        contentFound = has_xpath?(xpathElement)
      end
      y += 400
    end
  end




end