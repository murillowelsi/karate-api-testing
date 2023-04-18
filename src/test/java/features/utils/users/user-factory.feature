Feature: Generate user data

  Background:

    * def fakerObj = new faker()
    * def firstName = fakerObj.name().firstName()
    * def lastName = fakerObj.name().lastName()
    * def email = (firstName + '.' + lastName + '@test.com').toLowerCase()

  @ignore
  Scenario: Generate booking request body
    * def requestBody = { "name": "#(firstName)", "surname": "#(lastName)", "email": "#(email)" }