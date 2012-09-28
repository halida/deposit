Deposit
=================================

Rails plugin for saving additional data for model.

Requirements
---------------------------------
This gem is for Rails 3 with ActiveRecord and later versions only.

Install
---------------------------------
Add this to your Gemfile: 

```ruby
    gem 'deposit'
```

run `bundle install`,

And then `rails g deposit:install`, It will create table `deposits` for you.

Usage
---------------------------------
Simply add `as_depositable` to your model:

```ruby
class Product < ActiveRecord::Base
  as_depositable
end
```

you can load and save deposit like this:

```ruby
p = Product.last
p.save_deposit :transition, {id: 123, date: Time.now}
p.load_deposit :transition # => return saved data
```

