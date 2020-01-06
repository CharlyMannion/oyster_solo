Osytercard
=================
A programme that emulates London Underground Oystercard system

User Stories
-----
```
In order to use public transport
As a customer
I want money on my card

In order to keep using public transport
As a customer
I want to add money to my card

In order to protect my money
As a customer
I don't want to put too much money on my card

In order to pay for my journey
As a customer
I need my fare deducted from my card

In order to get through the barriers
As a customer
I need to touch in and out

In order to pay for my journey
As a customer
I need to have the minimum amount for a single journey

In order to pay for my journey
As a customer
I need to pay for my journey when it's complete

In order to pay for my journey
As a customer
I need to know where I've travelled from

In order to know where I have been
As a customer
I want to see to all my previous trips

In order to know how far I have travelled
As a customer
I want to know what zone a station is in

In order to be charged correctly
As a customer
I need a penalty charge deducted if I fail to touch in or out

In order to be charged the correct amount
As a customer
I need to have the correct fare calculated
```

Getting Started
---------
* Fork this repo
* Clone to your local machine
`git clone https://github.com/CharlyMannion/airport_solo`
* Run the command gem install bundle (if you don't have bundle already)
* When the installation completes, run bundle
* Run the command gem install bundle (if you don't have bundle already)
* When the installation completes, run bundle

Running Tests
---------
`rspec`


How I approached this challenge
---------
* I followed a TDD approach to this challenge.
* My first step was to write a feature tests, and watch them fail. I would then use the feature test to help me write a unit test, and watch it fail. I would read the error messages the unit test generated to help me write the code I wanted.
* I followed the Single Responsibility principle, and created separate classes and test suites
* I used mocks in my tests to override the random behaviour to ensure consistent test behaviour
* I ran rubocop regularly to help me improve my code.
* I wrote code to defend against edge cases
* I achieved 100% Test coverage
* When I was happy with the program at a particular point, I attempted to refactor to follow principles such as DRY
