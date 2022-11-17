# README

Depot is a toy Ruby on Rails application built as a learning project using the book
Agile Web Development with Rails 6.

There are lots of areas where improvement is needed, in particular the test coverage isn't good and I want to replace fixtures with
FactoryBots.

It would be nice to add more React

Upgrading to Rails 7 would be nice so I could get rid of webpacker

Currently using all Rails defaults that come with a generated application:

* Ruby 2.6.5

* Uses a sqlite3 database

* To populate the products table run `bin/rails db:seed`

The front end includes some React files, for the dynamic select used to select Pay Type

Translations for the Javascript are provided by i18-js.

There are two parts to this:
* The Rails translation files are exported using the 18n-js gem, which is configured in config/i18n.yml

* Every time new translations are added, if you need to use them in the React files you must export the Rails translations using the command `i18n export`

* The translations are made available to the Javascript library i18n-js
