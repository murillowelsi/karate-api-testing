Feature: Get all bookings
  Returns all bookings or bookings matching specified date and/or user id

  Background:
    * url baseUrl
    * call read('classpath:../features/utils/bookings/get-random-booking.feature')

  Scenario: Get all bookings passing query param user
    Given path '/booking'
    * def userId = randomBooking.userId
    And param user = userId
    When method GET
    Then status 200
    And match response == '#[]'
    And match each response[*] contains {date: '#string', destination: '#string', id: '#number', origin: '#string', userId: '#(userId)'}

  Scenario: Get all bookings with invalid user query param
    Given path '/booking'
    And param user = 'invalid_user_id'
    When method GET
    Then status 400
    And match response.message == "Validation errors"
    And match response.errors[0].message == "must be integer"

  Scenario: Get all bookings passing query param date
    Given path '/booking'
    * def date = randomBooking.date
    And param date = date
    When method GET
    Then status 200
    And match response == '#[]'
    And match each response[*] contains {date: '#(date)', destination: '#string', id: '#number', origin: '#string', userId: '#number'}


  Scenario: Get all bookings with invalid date query param
    Given path '/booking'
    And param date = 'invalid_date'
    When method GET
    Then status 400
    And match response.message == "Validation errors"
    And match response.errors[0].message == "must match format \"date\""