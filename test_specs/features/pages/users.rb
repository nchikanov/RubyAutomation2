class Users
  @@users = Hash.new { |h,k| h[k] = {} }
  @@users['PWP']['username'] = 'sdmtb8171'
  @@users['PWP']['password'] = 'flower1'

  def getUser(user, info)
    @@users[user][info]
  end

  def addUser(user, info, value)
    @@users[user][info] = value
  end
end