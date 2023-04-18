Feature: Get random user

  Background:
    * call read('classpath:../features/users/get-all-users.feature')

    * def users = karate.jsonPath(response, '$[*]')
    * def getRandomUser = function(){ return users[~~(Math.random()*users.length)] }
    * def randomUser = getRandomUser()

  @ignore
  Scenario: Get random user data
    * print randomUser
