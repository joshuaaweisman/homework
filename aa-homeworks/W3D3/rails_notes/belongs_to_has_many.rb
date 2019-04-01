BELONGS TO

# Table name: houses
# --------------------------------------------------------
# id            :integer         not null, primary key
# name          :string          not null
# created_at    :datetime        not null
# updated_at    :datetime        not null

class House < ApplicationRecord

end





# Table name: cats
# --------------------------------------------------------
# id            :integer         not null, primary key
# name          :string          not null
# created_at    :datetime
# updated_at    :datetime
# color         :string
# house_id      :integer

NOTE: The 'cats' class has a 'house_id'...meaning it BELONGS TO the 'House' class.






Here is the old, ugly way of writing that:

class Cat < ApplicationRecord

    def house
        House.find(self.house_id)    # This returns the specific HOUSE that this cat belongs to
    end

end


-----

Now here is the new, better way of writing that same thing:

class Cat < ApplicationRecord

    belongs_to( :house,         # The name of the method, like 'def house' up above
        primary_key: :id,       # The PRIMARY KEY of the house table (id), which we can use to find the specific HOUSE that this cat belongs to
        foreign_key: :house_id, # The name of the COLUMN that points to the house table ()
        class_name: 'House'     # The name of the thing we want to return (aka, the name of the House class)
    )

end

