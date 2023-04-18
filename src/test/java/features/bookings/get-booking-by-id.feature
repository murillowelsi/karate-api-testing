Feature: Get booking by ID
  Returns booking with given id

  Background:
    * url baseUrl
    * call read('classpath:../features/utils/bookings/get-random-booking.feature')

  Scenario: Get a booking by ID
    Given path '/booking/', randomBooking.id
    When method GET
    Then status 200
    And match response contains { "id": "#(randomBooking.id)", "date": "#(randomBooking.date)", "destination": "#(randomBooking.destination)", "userId": "#(randomBooking.userId)",  "origin": "#(randomBooking.origin)" }

  Scenario Outline: Get a booking by invalid ID
    Given path '/booking/', '<bookingId>'
    When method get
    Then status <statusCode>

    Examples:
      | bookingId | statusCode |
      | "abc"  | 400        |
      | "-1"   | 400        |
      | "0"    | 400        |
      | 99999  | 404        |