class URLs
  @@urls = Hash.new { |h,k| h[k] = {} }

  @@urls['Advanced Flight Search']["url"] = 'https://amex-qa.iseatz.com/flight_searches/new?'
  @@urls['Post']["url"] = 'https://qap.www.ihg.com/trip-extras/test_ihg_post'

  def getUrl(url)
    @@urls[url]['url']
  end
end