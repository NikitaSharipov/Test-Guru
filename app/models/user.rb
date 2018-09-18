class User < ApplicationRecord

  def test_by_lvl(level_input)
    pp Test.where("level = ?", level_input)
  end
end
