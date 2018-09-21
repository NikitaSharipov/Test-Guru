class Test < ApplicationRecord

  def test_by_category (category)
    Test.joins('JOIN categories ON tests.categories_id = categories.id').where(categories: {title: category}).order(title: :desc).pluck(:title)
  end
end
