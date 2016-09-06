class Users
  @@users = Hash.new { |h,k| h[k] = {} }

  @@users['Nina']['password'] = 'HelloP4ss'
  @@users['Nina']['firstname'] = 'Nina'
  @@users['Nina']['lastname'] = 'Grey'
  @@users['Nina']['email'] = 'nchikanov@gmail.com'
  @@users['Nina']['country phone code'] = 'Bolivia - 591'
  @@users['Nina']['phone number'] = '6504059619'
  @@users['Nina']['country code'] = 'United States (+1)'
  @@users['Nina']['gender'] = 'F'
  @@users['Nina']['DOB'] = '03261998'


  @@users['Mario']['password'] = 'supremeMarioRocks!'
  @@users['Mario']['firstname'] = 'Mario'
  @@users['Mario']['lastname'] = 'Tester'
  @@users['Mario']['email'] = 'nintendomario456@gmail.com'
  @@users['Mario']['gender'] = 'M'
  @@users['Mario']['dob'] = '01022016'
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
  @@users['Peach']['gender'] = 'F'
  @@users['Peach']['dob'] = '04052016'
  #birthday February 14 1972

  @@users['Wario']['password'] = 'WarioNotLuigi'
  @@users['Wario']['firstname'] = 'Wario'
  @@users['Wario']['lastname'] = 'Tester'
  @@users['Wario']['email'] = 'testerwario@gmail.com'
  #birthday July 26 1997


  def getUser(user, info)
    @@users[user][info]
  end

end