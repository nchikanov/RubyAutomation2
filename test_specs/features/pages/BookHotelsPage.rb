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

  def selectfirstbutton
    if has_xpath? ".//*[@class='DetailCard-bookButton DetailResults-bookButton _jq-detailCard-bookButton ng-scope'][text()='Book']"
      find('button', text: 'Book', :match => :first).click
    else
      puts "Could not select first 'BOOK' button"
    end
  end

end