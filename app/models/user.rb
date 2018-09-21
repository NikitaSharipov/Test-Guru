class User < ApplicationRecord

  has_many :involved_tests
  has_many :tests, through: :involved_tests
  has_many :tests


  def test_by_lvl(level_input)
    pp Test.joins('JOIN involved_tests ON involved_tests.tests_id = tests.id AND involved_tests.users_id = ?',self.id).where('level = ?', level_input)
  end
end
