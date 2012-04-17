Feature: ember-data in-memory adapter
  In order to cache application state
  As an ember-data user
  I want to store data in memory

  Background: 
    Given an ember app is loaded in the browser

  Scenario: finding a document by ID
    Given a document exists
    When I ask for it by ID
    Then I should receive it

  Scenario: find many documents by ID
    Given a bunch of documents exist
    When I ask for them by ID
    Then I should receive them all

  Scenario: searching for documents
    Given a bunch of documents exist
    When I search for some
    Then I should receive matching documents

  Scenario: getting all documents
    Given a bunch of documents exist
    When I ask for them all
    Then they should all be found

  Scenario: creating a document
    Given a new document
    When I save it
    Then it should be created

  Scenario: creating new documents
    Given a bunch of new documents
    When I save them
    Then it should create them all

  Scenario: updating a document
    Given a document exists
    When I change it's data
    And I save it
    Then it should be modified

  Scenario: updating many documents
    Given a bunch of documents exist
    When I change their data
    And I save them
    Then they should all be modified

  Scenario: delete a document
    Given a document exists
    When I delete it
    Then it should no longer exist

  Scenario: document many documents
    Given a bunch of documents exist
    When I delete them
    Then they should all no longer exist
