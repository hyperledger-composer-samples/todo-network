Feature: Basic data model

    Background:
        Given I have deployed the business network definition ..

    Scenario: Valid Todo items can be added with optional fields specified
        When I add the following asset of type org.example.todo.TodoItem
            | id | title      | completed |
            | 1  | Lots to do | true      |
        Then I should have the following assets of type org.example.todo.TodoItem
            | id | title      | completed |
            | 1  | Lots to do | true      |

    Scenario: Valid Todo items can be added with optional fields omitted
        When I add the following asset of type org.example.todo.TodoItem
            | id | title      |
            | 1  | Lots to do |
        Then I should have the following assets of type org.example.todo.TodoItem
            | id | title      | completed |
            | 1  | Lots to do | false     |

    Scenario: Invalid Todo items cannot be added with missing fields
        When I add the following asset of type org.example.todo.TodoItem
            | id |
            | 1  |
        Then I should get an error matching /ValidationException: Instance org\.example\.todo\.TodoItem#1 missing required field title/

