Feature: Get random booking

  Background:
    * call read('classpath:../features/bookings/get-all-bookings.feature')

    * def bookings = karate.jsonPath(response, '$[*]')
    * def getRandomBooking = function(){ return bookings[~~(Math.random()*bookings.length)] }

  @ignore
  Scenario: Get random booking data
    * def randomBooking = getRandomBooking()
