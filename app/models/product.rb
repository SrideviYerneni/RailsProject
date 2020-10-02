class Product < ApplicationRecord
validates :name, presence: true   
validates :upc, presence: true
validates :available_on, presence: true   
end
