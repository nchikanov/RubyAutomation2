
class BookCarsPage < SitePrism::Page


  def selectItemInAutosuggest(autosuggestName, item)
    case autosuggestName
      when 'car pickup' then
        find(:xpath, "html/body/ul[10]/li/a[text()='#{item}']").click
      when 'car rental company' then
        find(:xpath, "html/body/ul[7]/li/a[text()='#{item}']").click
    end
  end


end
