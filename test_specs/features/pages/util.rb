require 'capybara/rspec'

class UtilPage < SitePrism::Page

  element :pickupdate_label, :xpath, ".//div/h4[contains(@class,'DateTimeInput-header') and text()='Select pick up date']"
  element :datepickernext_button, :xpath, "//button[contains(@type,'button')]//i[@class='icoIcnCalendarNextActive']"
  element :monthtopick_label, :xpath, ".//div[contains(@class,'Calendar-month') and contains(@class,'Calendar-monthHeader') and text()='October 2015']"
  element :dropoffdate_label, :xpath, ".//div/h4[contains(@class,'DateTimeInput-header') and text()='Select drop off date']"
  element :pickmonth, :xpath,".//div[contains(@class,'Calendar Calendar--wide')]"
  element :picktime, :xpath,".//div[contains(@class,'TimePicker TimePicker--wide')]"
  element :termscondi_bar, :xpath,".//h3[@class='Collapsible-cta' and text()='VIEW TERMS & CONDITIONS']"
  element :managereservation_title, :xpath, ".//h2[@class='ManageTripExtras-title']"
  element :selectedcar_section, :xpath, ".//h4/span[contains(@class,'SelectedCarWidget-carName')]"
  element :searchform_section, :xpath, ".//div/form[contains(@class,'Form Form--search')]"
  element :differentcar_bar, 'div.Collapsible-header div.Collapsible-cta-icon i'
  element :show3days_checkbox, :xpath, ".//*[@id='flight_search_flex_search_input']/label/span"

  # element :differentcar_bar, :xpath, ".//*[@data-slnm-ihg='selectDifferentCarButtonSID']"
          # ".//*[@id='app']/div/div/div/div/div[2]/div[1]/div[2]/div/div"
          # ".//*[@id='app']/div/div/div/div/div[2]/div[1]/div[2]/div/div/div/i"
          # " .//div[@class='Collapsible-header']/descendant::h3[@data-slnm-ihg='selectDifferentCarButtonSID']"

  def setPageUrl (url)
    self.class.set_url url
    page.driver.browser.manage.window.maximize
    self.load
  end



        # def wait_for_ajax(timeout = Capybara.default_wait_time)
  #   page.wait_until(timeout) do
  #     page.evaluate_script 'jQuery.active == 0'
  #   end
  # end

  def verifymessage(message)
    case message
      when 'Your reservation has been cancelled.' then
        return has_xpath?("//li[span[text()='#{message}']]")
      when 'An error occured while trying to do a shop request. Please try again.' then
        return has_xpath?("//li[span[text()='#{message}']]")
      else
        "The '#{message}'was not found."
    end
  end

  def verifyElementExists(element)
    case element
      when 'Selected Car Display' then
        fail(ArgumentError.new('Selected Car section Display is not displayed')) if has_no_selectedcar_section?
      when 'Search form' then
        fail(ArgumentError.new('Search form section is not displayed')) if has_no_searchform_section?
      when 'Manage Reservation title' then
        fail(ArgumentError.new('Manage Reservation title is not displayed')) if has_no_managereservation_title?
      when 'New Location' then
        fail(ArgumentError.new('The location change was not made')) if has_no_modifiedlocation_field?
      when 'Rental Dates and Times' then
        fail(ArgumentError.new('Rental Dates and Times field is not present')) if has_no_rentaldates_title?
      when 'Location Selector' then
        fail(ArgumentError.new('Location Selector is not expanded')) if has_no_locatiosselector_dropdown?
      when 'IHG UHF' then
        fail(ArgumentError.new('IHG UHF is not displayed in the page')) if has_no_ihguhf_section?
      when 'Product Summary' then
        fail(ArgumentError.new('Product Summary is not displayed in the page')) if has_no_productsum_section?
      when 'Driver Information' then
        fail(ArgumentError.new('Driver Information is not displayed in the page')) if has_no_driverinfo_section?
      when 'Billing Details' then
        fail(ArgumentError.new('Billing Details is not displayed in the page')) if has_no_billingdet_section?
      when 'Terms and Conditions' then
        fail(ArgumentError.new('Terms and Conditions is not displayed in the page')) if has_no_termsandconditions_section?
      when 'Car Name or similar' then
        fail(ArgumentError.new('Car Name or similar is not displayed in the page')) if has_no_cartype_info?
      when 'Car Brand' then
        fail(ArgumentError.new('Car Brand logo is not displayed in the page')) if has_no_carbrand_logo?
      when 'car photo' then
        fail(ArgumentError.new('car photo is not displayed in the page')) if has_no_car_photo?
      when 'Car Details' then
        fail(ArgumentError.new('Car Details not displayed in the page')) if has_no_car_details?
      when 'Car Rental universal phone number' then
        fail(ArgumentError.new('Car Rental universal phone number not displayed in the page')) if has_no_universalphone_number?
      when 'Confirmation number' then
        fail(ArgumentError.new('Confirmation number is not displayed in the page')) if has_no_confirmation_number?
      when 'Pick-up and Drop-off - Date and Time' then
        fail(ArgumentError.new('Pick-up and Drop-off - Date and Time is not displayed in the page')) if has_no_pickupdropoff_info?
      when 'Location and Address' then
        fail(ArgumentError.new('Location and Address is not displayed in the page')) if has_no_locationaddress_info?
      when 'Duration of Trip' then
        fail(ArgumentError.new('Duration of Trip is not displayed in the page')) if has_no_durationtrip_info?
      when 'Number of vehicles' then
        fail(ArgumentError.new('Number of vehicles is not displayed in the page')) if has_no_vehicles_number?
      when 'Pre Cancellation' then
        fail(ArgumentError.new('The page is not in Pre Cancellation state')) if has_no_precancelation_state?
      when 'Cancellation Confirmation' then
        fail(ArgumentError.new('The page is not in Cancellation Confirmation state')) if has_no_cancelconfirmc_button?
      when 'Reservation Summary' then
        fail(ArgumentError.new('Reservation Summary is not displayed in the page')) if has_no_reservationsummaryc_section?
      when 'Cancel Reservation Confirmation' then
        fail(ArgumentError.new('Reservation Summary is not displayed in the page')) if has_no_cancelconfirmatioc_code?
      when 'Cancellation Disclosure copy' then
        fail(ArgumentError.new('Reservation Summary is not displayed in the page')) if has_no_disclaimercopyc_section?
    end
  end

  def selectDateFromDatePickerOld(field, pmonth, pday, ptime, dmonth, dday, dtime)
    if pickupdate_label
      within pickmonth do
        all(:xpath,".//div[contains(@class,'Calendar-tableContainer')]")
        while has_no_xpath?(".//div[contains(@class,'Calendar-monthHeader') and text()='#{pmonth}']")
          datepickernext_button.click
        end
        find(:xpath, ".//div[contains(@class,'Calendar-monthHeader') and text()='#{pmonth}']")
        if has_xpath?("//div/div/table/tbody/tr/td[contains(@class,'Calendar-day')]")
          find(:xpath,"//button[contains(@type,'button')and text()='#{pday}']", :match => :first).click
        end
      end
      within picktime do
        all(:xpath,"//div/div/table/tbody/tr/td[contains(@class,'TimePicker-cell')]")
        find(:xpath,"//button[contains(@type,'button')and text()='#{ptime}']").click
      end
    end
      if dropoffdate_label
      within pickmonth do
        all(:xpath,".//div[contains(@class,'Calendar-tableContainer')]")
        while has_no_xpath?(".//div[contains(@class,'Calendar-monthHeader') and text()='#{dmonth}']")
          datepickernext_button.click
        end
        find(:xpath, ".//div[contains(@class,'Calendar-monthHeader') and text()='#{pmonth}']")
        if has_xpath?("//div/div/table/tbody/tr/td[contains(@class,'Calendar-day')]")
          find(:xpath,"//button[contains(@type,'button')and text()='#{dday}']", :match => :first).click
        end
      end
      within picktime do
        all(:xpath,"//div/div/table/tbody/tr/td[contains(@class,'TimePicker-cell')]")
        find(:xpath,"//button[contains(@type,'button')and text()='#{dtime}']").click
      end
      end
  end
#Method to select a specific date from the date picker after code changed
  def selectDateFromDatePicker(field, pyear, pmonth, pday, ptime, dyear, dmonth, dday, dtime)
    if pickupdate_label
      within pickmonth do
        all(:xpath,".//div[contains(@class,'Calendar-month')]")
        while has_no_xpath?(".//div[contains(@class,'Calendar-monthHeader')]/span[@data-slnm-ihg='dateSelectMenuLeftMonthSID' and text()='#{pmonth} ']") and has_no_xpath?("//div/span[@data-slnm-ihg='dateSelectMenuLeftYearSID' and text()='#{pyear}']")
          datepickernext_button.click
        end
        find(:xpath, ".//div[contains(@class,'Calendar-monthHeader')]/span[@data-slnm-ihg='dateSelectMenuLeftMonthSID' and text()='#{pmonth} ']")
        if has_xpath?("//div/div/table/tbody/tr/td[contains(@class,'Calendar-day')]")
          find(:xpath,"//button[contains(@type,'button')and text()='#{pday}']", :match => :first).click
        end
      end
      within picktime do
        all(:xpath,"//div/div/table/tbody/tr/td[contains(@class,'TimePicker-cell')]")
        find(:xpath,"//button[contains(@type,'button')and text()='#{ptime}']").click
      end
    end
    if dropoffdate_label
      within pickmonth do
        all(:xpath,".//div[contains(@class,'Calendar-month')]")
        while has_no_xpath?(".//div[contains(@class,'Calendar-monthHeader')]/span[@data-slnm-ihg='dateSelectMenuLeftMonthSID' and text()='#{dmonth} ']") and has_no_xpath?("//div/span[@data-slnm-ihg='dateSelectMenuLeftYearSID' and text()='#{dyear}']")
          datepickernext_button.click
        end
        find(:xpath,".//div[contains(@class,'Calendar-monthHeader')]/span[@data-slnm-ihg='dateSelectMenuLeftMonthSID' and text()='#{dmonth} ']")
        if has_xpath?("//div/div/table/tbody/tr/td[contains(@class,'Calendar-day')]")
          find(:xpath,"//button[contains(@type,'button')and text()='#{dday}']", :match => :first).click
        end
      end
      within picktime do
        all(:xpath,"//div/div/table/tbody/tr/td[contains(@class,'TimePicker-cell')]")
        find(:xpath,"//button[contains(@type,'button')and text()='#{dtime}']").click
      end
    end
    end

  def expandBar(bar)
    case bar
      when 'CHOOSE A DIFFERENT CAR' then
        # page.execute_script("document.getElementByXpath('.//*[@data-slnm-ihg='selectDifferentCarButtonSID']').click()")
        page.execute_script("document.getElementByXpath('.//*[@id='app']/div/div/div[1]/div[2]/div/div/div[2]/div[1]/div[2]/div/div/div/i').click()")

        # page.execute_script("document.querySelector('div.Collapsible-header div.Collapsible-cta-icon i').click()")
        # differentcar_bar.click
        else
        fail(ArgumentError.new("BAR #{link} WAS NOT FOUND!"))
    end
  end

def verifyFieldIsEmpty(field)
  case field
    when 'Pick Up location' then
      return searchlocationutil_field.value == ''
    else
      fail(ArgumentError.new("'#{field}' does not exist!"))
  end
end

def setCheckbox(field, value)
  case field
    when 'Show me 3 days' then
      show3days_checkbox.click()
    when 'Return car to a different location' then
       page.execute_script("document.querySelector('label[for=searchForm_willReturnDifferentLocation] div.Checkbox-box').click()")
    when 'Use a different discount or promo code' then
      page.execute_script("document.querySelector('label[for=searchForm_showPromotionalCouponChk] div.Checkbox-box').click()")
    else
      fail(ArgumentError.new("#{field} checkbox WAS NOT FOUND!"))
  end
end
end










