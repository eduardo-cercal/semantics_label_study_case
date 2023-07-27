Feature: Login Page
    In order to get to the Home Page
    As a user
    I want signin

    Scenario: Valid Credentials
        Given the user provides valid credentials
        When the system try to login
        Then go to Home Page
    
    Scenario: Invalid Credentials
        Given the user provides invalid credentials
        When the system try to login
        Then show a invalid credentials error message
    
    Scenario: Unregistered User
        Given the user provides credentials
        When the system try to login
        Then show a unregistered user error message
    
    
    
    