
class BookCarsPage < SitePrism::Page

  element :car_pickup, :xpath, ".//*[@id='pick_up']"
  element :car_pickup_time, :xpath, ".//*[@id='car_search_start_time_input']/a"
  element :car_dropoff_time, :xpath, ".//*[@id='car_search_end_time_input']/a"
  element :aircon, :xpath, ".//*[@id='car_search_air_conditioning_input']/a"
  element :transmission, :xpath, ".//*[@id='car_search_transmission_type_input']/a"

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

end
