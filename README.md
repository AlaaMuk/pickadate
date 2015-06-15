# Pickadate

## Getting Started

After you have cloned this repo, run this setup script to set up your machine
with the necessary dependencies to run and test this app:

    % ./bin/setup

It assumes you have a machine equipped with Ruby, Postgres, etc. If not, set up
your machine with [this script].

[this script]: https://github.com/thoughtbot/laptop

After setting up, you can run the application using [foreman]:

    % foreman start

If you don't have `foreman`, see [Foreman's install instructions][foreman]. It
is [purposefully excluded from the project's `Gemfile`][exclude].

[foreman]: https://github.com/ddollar/foreman
[exclude]: https://github.com/ddollar/foreman/pull/437#issuecomment-41110407

## Guidelines

Use the following guides for getting things done, programming well, and
programming in style.

* [Protocol](http://github.com/thoughtbot/guides/blob/master/protocol)
* [Best Practices](http://github.com/thoughtbot/guides/blob/master/best-practices)
* [Style](http://github.com/thoughtbot/guides/blob/master/style)

## Deploying

If you have previously run the `./bin/setup` script,
you can deploy to staging and production with:

    $ ./bin/deploy staging
    $ ./bin/deploy production

## Setting Up Pickadate Feature

Reference Websites: 
* [Pickadate Website](http://amsul.ca/pickadate.js/)
* [Pickadate Gem](https://github.com/veracross/pickadate-rails)

Install "pickadate-rails" gem in your Gemfile.

    gem "pickadate-rails"

Run bundle install in your Terminal. 

In your application.js, add the javascript files to your tree:

    //= require pickadate/picker
    //= require pickadate/picker.date
    //= require pickadate/picker.time

In your application.scss, add the stylesheets:

    @import "pickadate/default";
    @import "pickadate/default.date";
    @import "pickadate/default.time";    

Create a file inside the javascript directory and add:

    $('.timepicker').pickatime();
    $('.datepicker').pickadate();
    
You may need to wrap these calls with a document load function like so:

    $(document).ready(function() {
        $(".datepicker").pickadate();
        console.log("test");
        $(".timepicker").pickatime();
    });

If you do not have a form, create an appointment model. Add a date field and a time field (but not a datetime field). In the Terminal, inside your directory: 

    $ rails g scaffold Appointment date:string time:string
    $ rake db:migrate
 
If you already had a date and time fields that are not string fields, then in your form partial view, change your form input fields to be displayed as a string. Add a ".datepicker" class to your date field, and a ".timepicker" class to your time field.

    <%= f.input :test_date, as: :string, label: "Schedule Date", input_html: { class: "datepicker"}  %>
    <%= f.input :test_time, as: :string, label: "Schedule Time", input_html: { class: "timepicker"} %>
    
Make sure your date and time fields are inside the controller params.

    params.require(:appointment).permit(:test_date, :test_time)
    
You should now be able to pick a date and time, and it should record to the database. Use Strftime to format the output of the date and time.
