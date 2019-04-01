class DummyHouse < ApplicationRecord
    validates :address, presence: true
end