@refinerycms @pages @pages-manage @page-roles
Feature: Change page roles
  In order to edit which roles can access a page
  As an administrator
  I want to be able to see current roles and change them, while editing a page

  Background:
    Given I am a logged in refinery user
    Given I am editing a page
    Given I click on the roles tab

  Scenario: Reading default refinery roles
    Then the "Refinery" role should be checked for the Read column

  @wip
  Scenario: Change a role's access
    When I uncheck the "Refinery" role to Read
    And I press "Save"
    And I am editing a page
    Then the "Refinery" role should be unchecked for the Read column
