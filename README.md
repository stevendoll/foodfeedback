Foodfeedback
================

This is a reference application demonstrating a technology stack, processes and tools to quickly build a high-quality Minimum Viable Product (MVP). 

Technology Stack

- Ruby on Rails
- Postgres Database
- Heroku hosting
- AWS S3 CDN for assets
- High quality bootstrap theme from WrapBootstrap ([https://wrapbootstrap.com/theme/inspinia-responsive-admin-theme-WB0R5L90S] Inspinia) 
- Twilio SMS support
- Pushmeup APNS push notifications
- Uuids used throughout
- Pundit for access and authorization

Tools

- Github
- Pivotal Tracker
- Codeship Continuous Integration
- CodeClimate
- Google Analytics
- Papertrail

Processes

- Lean practices so each work package is focused to deliver data on a testable market hypothesis
- Agile management with Pivotal Tracker, integrated with Github for traceability
- Test Driven Development (TDD) with RSpec
- Continuous Integration with Codeship linked to the Github repository. Codeship tests builds with RSpec, and "Green" builds on the production branch are automatically promoted to Heroku

[![Deploy to Heroku](https://www.herokucdn.com/deploy/button.png)](https://heroku.com/deploy)

This application was generated with the [rails_apps_composer](https://github.com/RailsApps/rails_apps_composer) gem
provided by the [RailsApps Project](http://railsapps.github.io/).

Documentation and Support
-------------------------

Technical documentation is stored in the Github Wiki.

Problems? Issues?
-------------

Issues are tracked in Pivotal Tracker.

Similar Projects
----------------

Check out

- Fatsecret
- Fitmess http://fitmess.herokuapp.com/
- Open mHealth http://www.openmhealth.org/about/
- Fitbit http://www.fitbit.com/apps/syncmetrics


Contributing
------------

This project is not open for contribution at this time. Please contact me at steven@kichocheo.com is you have a suggested use for this.


Credits
-------

This application is the work of Steven Doll. steven@kichocheo.com

License
-------

This application is Copyright 2015 to Steven Doll. The Inspinia theme is used under license.
