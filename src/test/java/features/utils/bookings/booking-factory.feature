Feature: Generate booking data

  Background:

    * call read('classpath:../features/utils/users/get-random-user.feature')
    * call read('classpath:../features/utils/bookings/get-date.feature')
    * call read('classpath:../features/utils/bookings/get-random-airport-code.feature')

  @ignore
  Scenario: Generate booking request body
    * def requestBody = { "userId": '#(randomUser.id)', "destination": '#(getAirportCode())', "origin": '#(getAirportCode())', "date": '#(date)' }