What does it mean to "validate" a belongs_to association

class Cat < ApplicationRecord
  belongs_to :home,
    primary_key: :id,
    foreign_key: :home_id,
    class_name: :Home,
    optional: true 
end


*****


What is a "seed?"

        Create your new Postgres database

        Run bundle exec rails db:create
        If you have migrations, run bundle exec rails db:migrate
        If you have seeds, run bundle exec rails db:seed