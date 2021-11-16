# FikaTogether

Welcome to the backend API repo of the Craft Academy, August 2021 cohort's final project. We have designed a fullstack application that encourages employees to take Fikas with employees from different departments, and different positions within a company, who would not normally mix. 

This was achieved by building an API that would match employees who are most dissimilar using a cosine similarity machine learning algorithm, which then interacts with the Google Calendar API to schedule a Fika between the employees. On the front end an information point admin portal was created to manage the Fikas and employees taking them.


### Badges and CI
[![Build Status](https://fraseer1430.semaphoreci.com/badges/FikaTogether-API/branches/master.svg?style=shields)](https://fraseer1430.semaphoreci.com/projects/FikaTogether-API) 
[![Maintainability](https://api.codeclimate.com/v1/badges/d0ce63dd75a878400163/maintainability)](https://codeclimate.com/github/CraftAcademy/FikaTogether-API/maintainability)
[![Test Coverage](https://api.codeclimate.com/v1/badges/d0ce63dd75a878400163/test_coverage)](https://codeclimate.com/github/CraftAcademy/FikaTogether-API/test_coverage)

### Authors
[Fraser Hughes](https://github.com/Fraseer) </br>
[Dorian Buck](https://github.com/dorianbuck) </br>
[Max Anderson](https://github.com/maxarvid) </br>
[August Enhager](https://github.com/AugustEnhager) </br>
[Oliver Ochman](https://github.com/oliverochman) </br>
[Thomas Ochman](https://github.com/tochman) </br>

## Special Thanks
A special thanks to our coaches Thomas Ochamn and Oliver Ochman for all the work and help they gave us over the course of the project.

### Gems Used
- ruby '3.0.2'
- active_model_serializers
- bootsnap
- devise_token_auth
- google-api-client
- lockbox
- pg
- puma
- rack-cors
- rails 6.1.4
- listen
- spring
- factory_bot_rails
- faker
- httplog
- pry-rails
- rspec-rails
- shoulda-matchers
- simplecov
- webmock

### License
MIT-License