# Allinone

A gem that adds multitenancy to a Rails app. Install the gem and your app is already capable of handling multiple domains, with a `current_site` method to help you scope data for a particular site. See Usage section for more details. 

## Installation

Add this line to your application's Gemfile:

    gem 'allinone'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install allinone

## Usage

There is sample application available here[https://github.com/Liberlabs/sample_multitenant_app]

1. Add a migration to create sites and domains tables in your app.

https://github.com/Liberlabs/sample_multitenant_app/blob/master/db/migrate/20150115080301_create_sites_and_domains.rb

2. Add Site and Domain models in your app:

https://github.com/Liberlabs/sample_multitenant_app/blob/master/app/models/site.rb
https://github.com/Liberlabs/sample_multitenant_app/blob/master/app/models/domain.rb

3. Run the migrations

    rake db:migrate

4. Add these 2 lines into your ApplicationController, towards the top.

    include Allinone::Core
    act_as_allinone

5. From the rails console, create a site and at least one domain.

    ```s = Site.create name: 'My Site'
    ```s.domains.create name: 'localhost'

You can create more sites and domains if you like. You can also create multiple domains for the same site. Make sure you point the domains you create to localhost using entries in /etc/hosts (on development machines) or using DNS on production servers.

6. Start the rails server and access the site.

   ```rails s
   ```In the browser, go to http://localhost:3000

`current_site` method will be accessible from your controllers and views. It will return the site object corresponding to the domain used to access the app. You can use current_site.id to scope the data for a particular site whereever you have to store/access data.

## Invalid Domain Handing

If an invalid domain (a domain that is not present in the domains table) is used to access the site, a 'Site not found' page will be displayed by default.

This behaviour can be customized by overriding `site_not_found_handler` method in the application controller as shown here. https://github.com/Liberlabs/sample_multitenant_app/blob/master/app/controllers/application_controller.rb#L10
