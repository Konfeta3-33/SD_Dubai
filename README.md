# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version: 3.1.1

* System dependencies

* Configuration

* Database creation

* Database initialization - run:
```ruby
Instructor.create!(
  name: 'Aleksandr',
  surname: 'Kunin',
  initials: 'AB',
  license: 'NA',
  user_attributes: { 
    login: 'admin',
    password: '123456',
    password_confirmation: '123456',
    admin: true
  }
)
```
* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...
