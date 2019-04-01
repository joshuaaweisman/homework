YOU CAN VALIDATE FOR:
    • presence:   --->   true
    • uniqueness: --->   true
    • format # tests whether a string matches a regular expression
    • length # tests whether a string has an appropriate length
        - minimum
        - maximum
    • unclusion


-----


EXAMPLE

class Cat < ApplicationRecord

    validates :name, presence: true, uniqueness: true   # }
                                                        # }  
    validates :color, presence: true                    # } --> These are MODEL-LEVEL VALIDATIONS, because they happen within the MODEL FILE in your Rails project
                                                        # }
    validate :no_green_cats                             # } &&&


    def no_green_cats                                   #   &&& This validation, called "no_green_cats", is a custom one that you create yourself
        if self.color == "green"
            self.errors[:color] << "can't be green"     # NOTE: Use SELF.ERRORS when creating a custom validation
        end
    end
    
end







test_cat.valid?
    # This will return true if the test_cat object passes all of your validations

    --

test_cat.errors
    # This will return an array of  the error messages for any validations that test_cat IS NOT passing

    class Person < ApplicationRecord
        validates :name, presence: true
      end
      
      >> p = Person.new
      #=> #<Person id: nil, name: nil>
      >> p.errors
      #=> {}
      
      >> p.valid?
      #=> false
      >> p.errors
      #=> {:name=>["can't be blank"]}
      
      >> p = Person.create
      #=> #<Person id: nil, name: nil>
      >> p.errors
      #=> {:name=>["can't be blank"]}
      
      >> p.save
      #=> false
      
      >> p.save!
      #=> ActiveRecord::RecordInvalid: Validation failed: Name can't be blank
      
      >> Person.create!
      #=> ActiveRecord::RecordInvalid: Validation failed: Name can't be blank


    --

test_cat.errors.full_messages
    # This will return an array of error messages for any validations that test_cat can't pass
    >> p = Person.create
    #=> #<Person id: nil, name: nil>
    >> p.errors.full_messages
    #=> ["Name can't be blank"]