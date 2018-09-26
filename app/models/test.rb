class Test < ApplicationRecord
  default_scope { order(created_at: :asc) }

  has_many :questions, dependent: :destroy
  has_many :involved_tests, dependent: :destroy
  has_many :users, through: :involved_tests

  belongs_to :category
  belongs_to :author, class_name: "User", foreign_key: :user_id

  validates :title, presence: true, uniqueness: { scope: :level }
  validates :level, numericality: { only_integer: true, greater_than: 0 }

  scope :easy, -> { where(level: 0..1) }
  scope :medium, -> { where(level: 2..4) }
  scope :hard, -> { where(level: 4..Float::INFINITY) }
  scope :by_category, -> (category) { joins(:category).where(categories: {title: category}) }
  scope :by_level, -> (level_input) { where(level: level_input)}

end
