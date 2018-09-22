class User < ApplicationRecord

  has_many :involved_tests, dependent: :destroy
  has_many :tests, through: :involved_tests
  has_many :tests, dependent: :nullify


  def test_by_lvl(level_input)
    Test.where( level: level_input)
  end
end
