Feature: Create booking
  Creates a new booking for user

  Background:
    * url baseUrl

  Scenario: Create a new booking
    * call read('classpath:../features/utils/bookings/booking-factory.feature')

    Given path '/booking'
    And request requestBody
    When method POST
    Then status 201
    And match response.id == '#number'
    And match response.date == "#(requestBody.date)"
    And match response.origin == "#(requestBody.origin)"
    And match response.destination == "#(requestBody.destination)"
    And match response.userId == "#(requestBody.userId)"

  Scenario Outline: Create a new booking without a <field>
    * call read('classpath:../features/utils/bookings/booking-factory.feature')

    Given path '/booking'
    And request requestBody
    And delete requestBody.<field>
    When method POST
    Then status 400
    And match response.message == "Validation errors"
    And match response.errors[0].message == "must have required property '<field>'"

    Examples:
      | field       |
      | userId      |
      | date        |
      | origin      |
      | destination |

