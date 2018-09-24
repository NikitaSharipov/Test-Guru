class User < ApplicationRecord

  has_many :involved_tests, dependent: :destroy
  has_many :tests, through: :involved_tests
  has_many :own_tests, class_name: "Test", foreign_key: :user_id, dependent: :nullify


  def test_by_lvl(level_input)
    Test.where( level: level_input)
  end
end
