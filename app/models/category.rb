class Category < ApplicationRecord
  has_many :own_tests, class_name: "Test", foreign_key: :category_id, dependent: :nullify
end
