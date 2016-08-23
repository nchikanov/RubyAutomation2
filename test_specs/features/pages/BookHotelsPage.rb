class BookHotelsPage < SitePrism::Page

  def selectItemInAutosuggest(autosuggestName, item)
    case autosuggestName
      when 'hotel city' then
        find(:xpath, "html/body/ul/li/a[text()='#{item}']").click
      else
        puts "#{item} was not selected in auto-suggest"
    end
  end

end