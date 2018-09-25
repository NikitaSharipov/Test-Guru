class Test < ApplicationRecord
  belongs_to :category
  belongs_to :author, class_name: "User", foreign_key: :user_id
  has_many :questions, dependent: :destroy
  has_many :involved_tests, dependent: :destroy
  has_many :users, through: :involved_tests

  validates :title, presence: true, uniqueness: { scope: :level }
  validates :level, numericality: { only_integer: true, greater_than: 0 }

  default_scope { order(created_at: :asc) }

  scope :dificulty_easy, -> { where(level: 0..1) }
  scope :dificulty_medium, -> { where(level: 2..4) }
  scope :dificulty_hard, -> { where(level: 4..Float::INFINITY) }

  scope :test_by_category, -> (category) { self.joins(:category).where(categories: {title: category}).pluck(:title) }

end
