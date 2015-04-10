Plumhire
========

A web application for managing the hiring of people.  It doesn't do much... yet!

System Dependencies
===================

- Bundler v1.9.2
- Ruby v2.2.1
- PhantomJS v2.0.0
- PostgreSQL v9.4.1
- Mac OS X v10.10

App Install & Config
====================

- Make sure system dependencies are installed (see above list)
- Clone the repo => `git clone git@github.com:amorphid/rails-plumhire.git`
- Install application dependencies => `bundle install`
- Set environment variables in `config/application.yml`
- Configure database in `config/database.yml`
- Set up the database => `bundle exec rake db:setup`
- Verify all tests pass => `bundle exec rspec`

License
=======

[MIT License](http://www.opensource.org/licenses/MIT)
