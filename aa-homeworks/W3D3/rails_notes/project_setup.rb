1. IN TERMINAL
Make sure that Rails is installed

            '
            gem install rails -v '5.1.2'
            '


----


2. IN TERMINAL
Generate a new Rails project

            '
            rails new demo_project -G --database=postgresql
            '

----


3. IN VS CODE
Add gems to your Gemfile

This is located here:

            '
            /demo_project
            '

Add the following gems to your 'development' group:

            group :development do

                # Run 'bundle exec annotate' in Terminal to add helpful comments to models.
                gem 'annotate'
            
                # These two give you a great error handling page.
                # But make sure to never use them in production!
                gem 'better_errors'
                gem 'binding_of_caller'
            
                # Gotta have byebug...
                gem 'byebug'
            
                # pry > irb
                gem 'pry-rails'
            end

----


4. IN TERMINAL
Install your gems

Run the following command:

                '
                bundle install
                '