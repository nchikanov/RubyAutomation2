class Util < SitePrism::Page

  element :datepickercurrentyear_label1, :xpath, ".//*[@id='ui-datepicker-div']/div[1]/div/div/span[@class='ui-datepicker-year']"
  element :datepickercurrentyear_label2, :xpath, ".//*[@id='ui-datepicker-div']/div[2]/div/div/span[@class='ui-datepicker-year']"
  element :datepickercurrentmonth_label1, :xpath, ".//*[@id='ui-datepicker-div']/div[1]/div/div/span[1]"
  element :datepickercurrentmonth_label2, :xpath, ".//*[@id='ui-datepicker-div']/div[2]/div/div/span[1]"
  element :datepickernext_button, :xpath, ".//*[@id='ui-datepicker-div']//a[@title='Next']"
  element :datepickerprevious_button, :xpath, ".//*[@id='ui-datepicker-div']//a[@title='Prev']"

  #AmexTravel Car Booking
  element :same_dropoff_radiobutton, :xpath, ".//*[@id='car_search_rental_type_input']/fieldset/ol/li[1]/label/span"
  element :diff_dropoff_radiobutton, :xpath, ".//*[@id='car_search_rental_type_input']/fieldset/ol/li[2]/label/span"
  element :search_city_airport_radiobutton, :xpath, ".//*[@id='car_search_pickup_use_address_input']/fieldset/ol/li[1]/label/span"
  element :search_address_radiobutton, :xpath, ".//*[@id='car_search_pickup_use_address_input']/fieldset/ol/li[2]/label/span"
  element :car_pickup, :xpath, ".//*[@id='pick_up']"

  #AmexTravel Flight Booking
  element :roundtrip_radiobutton, :xpath, ".//*[@id='flight_search_trip_type_input']/fieldset/ol/li[1]/label/span"
  element :oneway_radiobutton, :xpath, ".//*[@id='flight_search_trip_type_input']/fieldset/ol/li[2]/label/span"
  element :multicity_radiobutton, :xpath, ".//*[@id='flight_search_trip_type_input']/fieldset/ol/li[3]/label/span"

  #AmexTravel Hotel Booking
  element :city_landmark_search, :xpath, ".//*[@id='new_hotel_search']/fieldset[1]/ol/div/span[1]"
  element :address_search, :xpath, ".//*[@id='new_hotel_search']/fieldset/ol/div/span[2]"
  element :where_going_search_bar, :xpath, ".//*[@id='hotel_search_location_name']"



  def setValue(element, value)
    case element
      when 'Where will you pick up the car' then
        car_pickup.click
        car_pickup.set value
        @bookcarspage.selectItemInAutosuggest('car pickup', value)
      when 'Where are you going - Hotel' then
        where_going_search_bar.click
        where_going_search_bar.set value
        @bookhotelspage.selectItemInAutosuggest('hotel city', value)
      else
        puts "#{value} was not properly set in field"
    end
    end

    def selectRadioButton(option)
    case option
      ###AmexTravelCar.feature###
      when 'Drop-off location same as pick-up' then
        same_dropoff_radiobutton.click
      when 'Different drop-off location' then
        diff_dropoff_radiobutton.click
      when 'Search by city or airport' then
        search_city_airport_radiobutton.click
      when 'Search by address' then
        search_address_radiobutton.click

        ###AmexTravelFlight.feature###
      when 'Round Trip' then
        roundtrip_radiobutton.click
      when 'One Way' then
        oneway_radiobutton.click
      when 'Multi-City' then
        multicity_radiobutton.click

        ###AmexTravelHotel.feature###
      when 'Search by city or landmark' then
        city_landmark_search.click
      when 'Search by address' then
        address_search.click

      else "The '#{option}' was not found."
    end
  end

  # Generic that returns whether a mail has a given content or not
  # content: regular expression
  # unread: boolean to mark mail as unread or not
  def mailHasContent(useraccount, password, subject, content, unread)
    Gmail.connect(useraccount, password) do |gmail|
      # @users = Users.new
      # gmail = @users.getSession(useraccount, password)
      puts "Looking for '#{subject}' in gmail account..."
      gmail.inbox.emails(:unread, :subject => subject).each do |email|
        if email.body.to_s =~ /#{content}/m
          puts "Found the content we were looking for!"
          unread ? email.mark(:unread) : email.mark(:read)
          return true
        else
          email.mark(:unread)
        end
      end
    end
    return false
  end

  def selectDateFromDatePicker(date_to_pick)
    months = ['January', 'February', 'March', 'April', 'May', 'June', 'July', 'August', 'September', 'October', 'November', 'December']
    dateArray = date_to_pick.split('/')
    day = dateArray[1]
    month = dateArray[0]
    year = dateArray[2]

    #Manage the picker to reach specified year
    if year.to_i > datepickercurrentyear_label2.text.to_i
      while datepickercurrentyear_label2.text.to_i < year.to_i  do
        datepickernext_button.click
      end
    elsif year.to_i < datepickercurrentyear_label1.text.to_i
      while datepickercurrentyear_label1.text.to_i > year.to_i  do
        datepickerprevious_button.click
      end
    end
    #Manage the picker to reach specified month
    if month.to_i > (months.index(datepickercurrentmonth_label2.text)+1)
      while month.to_i > (months.index(datepickercurrentmonth_label2.text)+1) do
        datepickernext_button.click
      end
    elsif month.to_i < (months.index(datepickercurrentmonth_label1.text)+1)
      while month.to_i < (months.index(datepickercurrentmonth_label1.text)+1) do
        datepickerprevious_button.click
      end
    end

    if datepickercurrentmonth_label1.text.to_i == month
      find(:xpath, ".//*[@id='ui-datepicker-div']/div[1]/table/tbody/tr/td/a[text()='#{day.to_i}']").click
    else
      find(:xpath, ".//*[@id='ui-datepicker-div']/div[2]/table/tbody/tr/td/a[text()='#{day.to_i}']").click
    end

  end

  def verifyElementExists(element, input)

    case element
      when 'Total Passengers' then
        fail(ArgumentError.new('Passenger total does not match original search')) if has_no_xpath?(".//*[@id='summary-form']/div/div/div/div/div/div/span[text()='#{input}']")
      when 'Class Type' then
        fail(ArgumentError.new('Class type does not match original search')) if has_no_xpath?(".//*[@id='summary-form']/div/div/div/div/ol/a/span[text()='#{input}']")
      when 'Departure Airport' then
        fail(ArgumentError.new('Departure airport does not match original search')) if has_no_xpath?(".//*[@id='flight_search_flight_search_slices_attributes_0_departure_search_for'][contains(@value, '#{input}')]")
      when 'Arrival Airport' then
        fail(ArgumentError.new('Departure airport does not match original search')) if has_no_xpath?(".//*[@id='flight_search_flight_search_slices_attributes_0_arrival_search_for'][contains(@value, '#{input}')]")
      when 'Airport 1 From' then
        fail(ArgumentError.new('First departure airport does not match original search')) if has_no_xpath?(".//*[@class='SummaryMulti-flightOrigin'][contains(text(), '#{input}')]")
      when 'Airport 1 To' then
        fail(ArgumentError.new('First arrival airport does not match original search')) if has_no_xpath?(".//*[@id='_iz']/div/div/div/div/table/tbody/tr[1]/td/span[3][contains(text(), '#{input}')]")
      when 'Airport 2 From' then
        fail(ArgumentError.new('Second departure airport does not match original search')) if has_no_xpath?(".//*[@id='_iz']/div/div/div/div/table/tbody/tr[2]/td/span[1][contains(text(), '#{input}')]")
      when 'Airport 2 To' then
        fail(ArgumentError.new('Second arrival airport does not match original search')) if has_no_xpath?(".//*[@id='_iz']/div/div/div/div/table/tbody/tr[2]/td/span[3][contains(text(), '#{input}')]")
      when 'Airport 3 From' then
        fail(ArgumentError.new('Third departure airport does not match original search')) if has_no_xpath?(".//*[@id='_iz']/div/div/div/div/table/tbody/tr[3]/td/span[1][contains(text(), '#{input}')]")
      when 'Aiport 3 To' then
        fail(ArgumentError.new('Third arrival airport does not match original search')) if has_no_xpath?(".//*[@id='_iz']/div/div/div/div/table/tbody/tr[1]/td/span[3][contains(text(), '#{input}')]")
      when 'Multi Class Type' then
        fail(ArgumentError.new('Class type does not match original search')) if has_no_xpath?(".//*[@id='_iz']/div/div/div/div/div/span[2][contains(text(), '#{input}')]")
      when 'Multi Total Passengers' then
        fail(ArgumentError.new('Passenger total does not match original search')) if has_no_xpath?(".//*[@id='_iz']/div/div/div/div/div/span[2][contains(text(), '#{input}')]")

        #Cars
      when 'car pickup city' then
        fail(ArgumentError.new('Car pickup city does not match original search')) if has_no_xpath?(".//*[@id='car_search_pickup_location'][@value='#{input}']")
      when 'car dropoff city' then
        fail(ArgumentError.new('Car dropoff city does not match original search')) if has_no_xpath?(".//*[@id='car_search_dropoff_location'][@value='#{input}']")
      when 'car pickup time' then
        fail(ArgumentError.new('Car pickup time does not match original search')) if has_no_xpath?(".//*[@id='car_search_start_time_input']/a/span[text()='#{input}']")
      when 'car dropoff time' then
        fail(ArgumentError.new('Car dropoff time does not match original search')) if has_no_xpath?(".//*[@id='car_search_end_time_input']/a/span[text()='#{input}']")
    end
  end


end

