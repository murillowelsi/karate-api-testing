Feature: Get random airport code

  Background:
    * def airports = ["AMS", "BCN", "CDG", "CPH", "FCO", "FRA", "LHR", "MAD", "MUC", "OSL", "PRG", "TXL", "VIE", "ZRH"]

  @ignore
  Scenario: Get random airport code
    * def getAirportCode = function(){ return airports[~~(Math.random()*airports.length)] }
    * def airportCode = getAirportCode()
