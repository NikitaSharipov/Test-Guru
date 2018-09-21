class Test < ApplicationRecord
  belongs_to :category
  belongs_to :user
  has_many :questions
  has_many :involved_tests
  has_many :users, through: :involved_tests



  def test_by_category (category)
    Test.joins('JOIN categories ON tests.categories_id = categories.id').where(categories: {title: category}).order(title: :desc).pluck(:title)
  end
end
