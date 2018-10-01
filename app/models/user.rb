class User < ApplicationRecord

  has_many :involved_tests, dependent: :destroy
  has_many :tests, through: :involved_tests
  has_many :own_tests, class_name: "Test", foreign_key: :user_id, dependent: :nullify

  validates :email, presence: true

#  scope :test_by_lvl, -> (level_input) { Test.where(level: level_input) }
#  scope :test_by_lvl1, -> (level_input) { tests.where(level: level_input) }

  def test_by_lvl(level_input)
    tests.by_level(level_input)
  end
end
