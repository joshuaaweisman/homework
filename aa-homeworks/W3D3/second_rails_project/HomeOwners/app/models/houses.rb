class House < ApplicationRecord
    validates :address, presence: true

    has_many(
        :people,
    )
end