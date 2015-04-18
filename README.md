Foodfeedback
================

[Food Feedback](http://foodfeedback.herokuapp.com) is an app that helps a nutritionist or dietition better connect with clients by making it easy for the practitioner to monitor the diet diaries of the clients. 

- The practitioner registers his or her practice
- The practitioner invites clients
- Clients respond to the invitation by creating and connecting their FatSecret accounts
- The practitioner can view clients' FatSecret diet diaries

Food Feedback demonstrates:

- Registration and invitation workflows
- Multi-tenancy: the application supports multiple practices, each with users in various roles
- OAuth login
- API consumption: FatSecret API


Food Feedback is a reference application demonstrating the technology stack, processes and tools that enable a startup to quickly build a high-quality Minimum Viable Product (MVP). 

Technology Stack

- Ruby on Rails
- Postgres Database
- Heroku hosting
- AWS S3 CDN for assets
- Bootstrap theme from WrapBootstrap [https://wrapbootstrap.com/theme/inspinia-responsive-admin-theme-WB0R5L90S](Inspinia)
- Twilio SMS support
- Pushmeup APNS push notifications
- Uuids used throughout
- Pundit for access and authorization

Tools

- [Github](https://github.com/stevendoll/foodfeedback)
- [Pivotal Tracker](https://www.pivotaltracker.com/projects/1235218)
- [Codeship Continuous Integration](https://codeship.com/projects/55520)
- [CodeClimate](https://codeclimate.com/github/stevendoll/foodfeedback)
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

- [Fatsecret](http://www.fatsecret.com/)
- [Fitmess](http://fitmess.herokuapp.com/)
- [Open mHealth](http://www.openmhealth.org/about/)
- [Fitbit](http://www.fitbit.com/apps/syncmetrics)


Contributing
------------

This project is open for contribution. Please contact me at steven@kichocheo.com is you have a suggested use.


Credits
-------

This application is the work of Steven Doll. steven@kichocheo.com

License
-------

This application is Copyright 2015 to Steven Doll. The Inspinia theme is used under license.
