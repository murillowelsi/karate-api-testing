Feature: Generate future date

  Background:
    * def random = new java.util.Random()
    * def daysToAdd = random.nextInt(30) + 1
    * def futureDate = Java.type('java.time.LocalDate').now().plusDays(daysToAdd)
    * def formattedDate = futureDate.format(java.time.format.DateTimeFormatter.ofPattern('yyyy-MM-dd'))

  @ignore
  Scenario: Get future date
    * def date = formattedDate
