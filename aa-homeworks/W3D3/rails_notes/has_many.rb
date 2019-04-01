HAS MANY

# Table name: cats
# --------------------------------------------------------
# id            :integer         not null, primary key
# name          :string          not null
# created_at    :datetime
# updated_at    :datetime
# color         :string
# house_id      :integer

class Cat < ApplicationRecord

end





# Table name: houses
# --------------------------------------------------------
# id            :integer         not null, primary key
# name          :string          not null
# created_at    :datetime        not null
# updated_at    :datetime        not null

NOTE: The 'house' class HAS MANY cats.

Here is how we write that out:

class House < ApplicationRecord

   has_many :cats, {            # The name of the method, like 'def cats' but done with syntactic sugar
        primary_key: :id,       # The PRIMARY KEY of THIS table (id), which we can use to find the specific HOUSE that this cat belongs to
        foreign_key: :house_id  # The name of the COLUMN that points to the house table ()
        class_name: 'Cat'       # The name of the thing we want to return (aka, the name of the House class)
    }

end