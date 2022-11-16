Feature: example

  Background:
    * url 'https://petstore.swagger.io/v2'

  Scenario: Get Request
    Given url 'https://petstore.swagger.io/v2'
    And path '/store/inventory'
    When method get
    Then status 200
    Then match $.anilable == 1
    Then assert responseTime < 2000

  Scenario: Send Query Parameter
    Given url 'https://petstore.swagger.io/v2'
    And path '/pet/findByStatus'
    And param status = 'pending'
    When method get
    Then status 200

  Scenario: Def operation and Post Request
    * def requestBody =
        """
        {
  "id": 0,
  "category": {
    "id": 0,
    "name": "string"
  },
  "name": "doggie",
  "photoUrls": [
    "string"
  ],
  "tags": [
    {
      "id": 0,
      "name": "string"
    }
  ],
  "status": "available"
}
        """
    Given url 'https://petstore.swagger.io/v2'
    And path '/pet'
    And request requestBody
    And header content-type = 'application/json'
    When method post
    Then status 200

        
