require 'digest/sha1'

class User < ApplicationRecord

  has_many :test_passages, dependent: :destroy
  has_many :tests, through: :test_passages
  has_many :own_tests, class_name: "Test", foreign_key: :user_id, dependent: :nullify

  validates :email, format: { with: /@/ }, uniqueness: true

  has_secure_password

  def test_by_lvl(level_input)
    tests.by_level(level_input)
  end

  def test_passage(test)
    test_passages.order(id: :desc).find_by(test_id: test.id)
  end

end
