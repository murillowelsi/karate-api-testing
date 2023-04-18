Feature: Get user by ID
  Returns user with given id

  Background:
    * url baseUrl
    * call read('classpath:../features/utils/users/get-random-user.feature')

  Scenario: Get a user by ID
    Given path '/user/', randomUser.id
    When method GET
    Then status 200
    And match response contains { "id": "#(randomUser.id)", "name": "#(randomUser.name)", "surname": "#(randomUser.surname)", "email": "#(randomUser.email)" }

  Scenario Outline: Get a user by invalid ID
    Given path '/user/', '<userId>'
    When method GET
    Then status <statusCode>

    Examples:
      | userId | statusCode |
      | "abc"  | 400        |
      | "-1"   | 400        |
      | "0"    | 400        |
      | 99999  | 404        |