@refinerycms @pages @pages-manage @page-roles
Feature: Admin pages have roles tab
  In order change the roles for a page
  As an administrator
  I want be able to access the roles tab

  Background:
    Given I am a logged in refinery user
    And I am editing a page

  Scenario: Page Edit Shows Roles Tab
    Then I should see "Roles" within "#page_parts"

