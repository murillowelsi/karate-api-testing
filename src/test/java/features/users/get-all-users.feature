Feature: Get all users
  Returns all users

  Background:
    * url baseUrl

  Scenario: Get all users
    Given path '/user'
    When method GET
    Then status 200
    And match response == '#[]'
    And match each response[*] contains {name: '#string', surname: '#string', id: '#number', email: '#string'}