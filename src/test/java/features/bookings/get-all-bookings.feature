Feature: Get all bookings
  Returns all bookings or bookings matching specified date and/or user id

  Background:
    * url baseUrl

  Scenario: Get all bookings
    Given path '/booking'
    When method GET
    Then status 200
    And match response == '#[]'
    And match each response[*] contains {date: '#string', destination: '#string', id: '#number', origin: '#string', userId: '#number'}