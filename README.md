# HexletCode
This gem allows you to easily create forms like SimpleForm gem.

## How to install
Add this line to your application's Gemfile:

```ruby
gem 'hexlet_code'
```
And then execute:

```
$ bundle install
```
Or install it yourself as:

```
$ gem install hexlet_code
```

## Usage
Module `HexletCode` has one method `form_for(instance, options, &block)`.

You can use that method without block to create empty HTML forms.

```ruby
HexletCode.form_for user, { url: '/users' } do |f|
end

# <form action="/users" method="post"></form>
```
And if you want to fill your form with different types of inputs, just pass some data to block. For that action you can use methods `input` and `submit`.

`input` will add label and input inside your form. It has optional parameter `as`, you can send it with `text` symbol and then you will get `textarea` instead of `input`.

And `submit` method will add button to your form.

```ruby
HexletCode.form_for user do |f|
  f.input :name
  f.input :job
  f.submit
end

# <form action="#" method="post">
#   <label for="name">Name</label>
#   <input name="name" type="text">
#   <label for="job">Job</label>
#   <input name="job" type="text" value="hexlet">
#   <input type="submit" value="Save">
# </form>
```
## Makefile
You can run different commands with the help of Makefile.

For example:

`make install` - to install this gem

`make lint` - to check code for mistakes

`make test` - to run tests
