require 'faker'

# Preliminary Create Chipotle Test Data
test1 = Workplace.new(
  name: 'Chipotle',
  city: 'Indianapolis',
  state: 'Indiana',
  address: '4625 East 96th Street'
  )
test1.save
test2 = Workplace.new(
  name: 'Chipotle',
  city: 'Indianapolis',
  state: 'Indiana',
  address: '3340 West 86th Street'
  )
test2.save
test3 = Workplace.new(
  name: 'Chipotle',
  city: 'Indianapolis',
  state: 'Indiana',
  address: '1002 Broad Ripple Avenue'
  )
test3.save


# Create Non-Chain restaurant data
test4 = Workplace.new(
  name: "Mom and Pop's Diner",
  city: 'Nowhere',
  state: 'Indiana',
  address: '1234 Patriot Drive'
  )
test4.save