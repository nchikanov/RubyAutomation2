class Payments
  @@payments = Hash.new { |h,k| h[k] = {} }

  @@payments['Nina']['Name on card'] = "Callie O'Malley"
  @@payments['Nina']['Card Type'] = 'Visa'
  @@payments['Nina']['Card Number'] = '4675920100610406'
  @@payments['Nina']['Exp. Month'] = '09'
  @@payments['Nina']['Exp. Year'] = '2020'
  @@payments['Nina']['CID'] = '816'
  @@payments['Nina']['Street Address'] = '1600 Amphitheatre Parkway'
  @@payments['Nina']['Country'] = 'United States'
  @@payments['Nina']['Zip Code'] = '94043'
  @@payments['Nina']['Town'] = 'Mountain View'
  @@payments['Nina']['State'] = 'CA'

  def getPaymentInfo(user, info)
    @@payments[user][info]
  end

end