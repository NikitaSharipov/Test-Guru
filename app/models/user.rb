class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable

  has_many :test_passages, dependent: :destroy
  has_many :tests, through: :test_passages
  has_many :own_tests, class_name: "Test", foreign_key: :author_id, dependent: :nullify
  has_many :gists, dependent: :destroy
  has_many :badge_reception, dependent: :destroy
  has_many :badges, through: :badge_reception
  has_many :own_badges, class_name: "Badge", foreign_key: :author_id, dependent: :nullify

  def test_by_lvl(level_input)
    tests.by_level(level_input)
  end

  def test_passage(test)
    test_passages.order(id: :desc).find_by(test_id: test.id)
  end

  def admin?
    self.is_a?(Admin)
  end

  def full_name
    self.first_name + ' ' + self.last_name
  end

  def has_badge?(badge)
    self.badges.include?(badge)
  end

end
