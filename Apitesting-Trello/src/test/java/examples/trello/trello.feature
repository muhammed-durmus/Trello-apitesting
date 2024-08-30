Feature: trello


  Background:
    * url baseUrl
    * def boardName = 'YOUR_BOARD_NAME'
    * def listName = 'YOUR_LIST_NAME'
    * def cardName = 'YOUR_CARD_NAME'
    * def newCardName = 'YOUR_NEW_CARD_NAME'


  Scenario: Create a new Trello board
    Given path '/boards'
    And param name = boardName
    And param key = apiKey
    And param token = apiToken
    When method post
    Then status 200
    And match response.name == boardName

  Scenario: Create a New List

    Given path '/members/me/boards'
    And param key = apiKey
    And param token = apiToken
    When method get
    Then status 200
    * def board = response.find(x => x.name == boardName)
    * def boardId = board.id
    * print "BOARD = " + boardId

    Given path '/boards/' + boardId + '/lists'
    And param name = listName
    And param key = apiKey
    And param token = apiToken
    When method post
    Then status 200
    And match response.name == listName



  Scenario: Create a new Card

    Given path '/members/me/boards'
    And param key = apiKey
    And param token = apiToken
    When method get
    Then status 200
    * def board = response.find(x => x.name == boardName)
    * def boardId = board.id
    * print "BOARD = " + boardId

    Given path '/boards/' + boardId + '/lists'
    And param key = apiKey
    And param token = apiToken
    When method get
    Then status 200
    * def lists = response
    * def list = lists.find(x => x.name == listName)
    * def listId = list.id
    * print "LIST ID = " + listId

    Given path '/lists/' + listId + '/cards'
    And param name = cardName
    And param key = apiKey
    And param token = apiToken
    When method post
    Then status 200
    And match response.name == cardName


  Scenario: Update Card

    Given path '/members/me/boards'
    And param key = apiKey
    And param token = apiToken
    When method get
    Then status 200
    * def board = response.find(x => x.name == boardName)
    * def boardId = board.id
    * print "BOARD = " + boardId

    Given path '/boards/' + boardId + '/lists'
    And param key = apiKey
    And param token = apiToken
    When method get
    Then status 200
    * def lists = response
    * def list = lists.find(x => x.name == listName)
    * def listId = list.id
    * print "LIST ID = " + listId

    Given path '/lists/' + listId + '/cards'
    And param key = apiKey
    And param token = apiToken
    When method get
    Then status 200
    * def cards = response
    * def cards = cards.find(x => x.name == cardName)
    * def cardId = cards.id
    * print "CARD ID = " + cardId


    Given path '/cards/' + cardId
    And param name = newCardName
    And param key = apiKey
    And param token = apiToken
    When method put
    Then status 200
    And match response.name == newCardName