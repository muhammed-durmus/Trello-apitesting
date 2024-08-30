Feature: Trello

  Background:
    * url baseUrl
    * def boardName = 'YOUR_BOARD_NAME'
    * def listName = 'YOUR_LIST_NAME'
    * def cardName = 'YOUR_CARD_NAME'
    * def newCardName = 'YOUR_NEW_CARD_NAME'

  Scenario: Create and Update a Trello Card
    Given path '/boards'
    And param name = boardName
    And param key = apiKey
    And param token = apiToken
    When method post
    Then status 200
    * def boardId = response.id

    Given path '/boards/' + boardId + '/lists'
    And param name = listName
    And param key = apiKey
    And param token = apiToken
    When method post
    Then status 200
    * def listId = response.id

    Given path '/lists/' + listId + '/cards'
    And param name = cardName
    And param key = apiKey
    And param token = apiToken
    When method post
    Then status 200
    * def cardId = response.id

    Given path '/cards/' + cardId
    And param name = newCardName
    And param key = apiKey
    And param token = apiToken
    When method put
    Then status 200
    And match response.name == newCardName
