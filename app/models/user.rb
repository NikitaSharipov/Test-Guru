class User < ApplicationRecord

  def test_by_lvl(level_input)
    pp Test.joins('JOIN involved_tests ON involved_tests.tests_id = tests.id AND involved_tests.users_id = ?',self.id).where('level = ?', level_input)
  end
end
