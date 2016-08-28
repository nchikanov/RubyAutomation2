class Users
  @@users = Hash.new { |h,k| h[k] = {} }

  @@users['Nina']['password'] = 'S0l0m0n!!'
  @@users['Nina']['firstname'] = 'Nina'
  @@users['Nina']['lastname'] = 'Chikanov'
  @@users['Nina']['email'] = 'nchikanov@gmail.com'
  @@users['Nina']['phone number'] = '6506194059'
  @@users['Nina']['country phone code'] = 'Bolivia - 591'
  @@users['Nina']['country code'] = 'United States (+1)'

  @@users['Nina-FB']['password'] = 'S0l0m0n!!'
  @@users['Nina-FB']['firstname'] = 'Nina'
  @@users['Nina-FB']['lastname'] = 'Chikanov'
  @@users['Nina-FB']['email'] = 'nina.chikanov@gmail.com'

  @@users['Alex-FB']['password'] = '30qatest30'
  @@users['Alex-FB']['firstname'] = 'Aleks'
  @@users['Alex-FB']['lastname'] = 'Chikanov'
  @@users['Alex-FB']['email'] = 'qatest30@mindjet.com'

  @@users['Mario']['password'] = 'supremeMarioRocks!'
  @@users['Mario']['firstname'] = 'Mario'
  @@users['Mario']['lastname'] = 'Tester'
  @@users['Mario']['email'] = 'nintendomario456@gmail.com'
  #birthday March 10 1984

  @@users['Luigi']['password'] = 'LuigiWahoo!!'
  @@users['Luigi']['firstname'] = 'Luigi'
  @@users['Luigi']['lastname'] = 'Tester'
  @@users['Luigi']['email'] = 'testerluigi4@gmail.com'
  #birthday September 3 1990

  @@users['Peach']['password'] = 'QueenPeach'
  @@users['Peach']['firstname'] = 'Peach'
  @@users['Peach']['lastname'] = 'Tester'
  @@users['Peach']['email'] = 'testerpeach@gmail.com'
  #birthday February 14 1972

  @@users['Wario']['password'] = 'WarioNotLuigi'
  @@users['Wario']['firstname'] = 'Wario'
  @@users['Wario']['lastname'] = 'Tester'
  @@users['Wario']['email'] = 'testerwario@gmail.com'
  #birthday July 26 1997


  #Note to self: I don't want the Internet to have access to this information

  def getUser(user, info)
    @@users[user][info]
  end

end