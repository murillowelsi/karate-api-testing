Feature: Create user
  Creates a new user

  Background:
    * url baseUrl

  Scenario: Create a new user
    * call read('classpath:../features/utils/users/user-factory.feature')

    Given path '/user'
    And request requestBody
    When method POST
    Then status 201
    And match response == { id: '#number', name: '#(firstName)', surname: '#(lastName)', email: '#(email)' }

  Scenario: Create a new user with an existing email address
    * call read('classpath:../features/utils/users/user-factory.feature')
    * call read('classpath:../features/utils/users/get-random-user.feature')
    * def existingEmail = randomUser.email
    * def expectedMessage = "User with email '" +existingEmail+ "' already exists"

    Given path '/user'
    And request { name: 'John', surname: 'Doe', email: '#(existingEmail)' }
    When method POST
    Then status 409
    And match response contains { 'errors': null, 'message': '#(expectedMessage)' }

  Scenario Outline: Create a new user without a <field>
    * call read('classpath:../features/utils/users/user-factory.feature')

    Given path '/user'
    And request requestBody
    And delete requestBody.<field>
    When method POST
    Then status 400
    And match response.message == "Validation errors"
    And match response.errors[0].message == "must have required property '<field>'"

    Examples:
      | field   |
      | name    |
      | surname |
      | email   |

