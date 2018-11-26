class Test < ApplicationRecord

  has_many :questions, dependent: :destroy
  has_many :test_passages, dependent: :destroy
  has_many :users, through: :test_passages
  belongs_to :category
  belongs_to :author, class_name: "User", optional: true

  validates :title, presence: true, uniqueness: { scope: :level }
  validates :level, numericality: { only_integer: true, greater_than: 0 }

  scope :by_level, -> (level_input) { where(level: level_input)}
  scope :easy, -> { by_level(0..1) }
  scope :medium, -> { by_level(2..4) }
  scope :hard, -> { by_level(4..Float::INFINITY) }
  scope :by_category, -> (category) { joins(:category).where(categories: {title: category}) }

  def timer?
    self.passage_time.present?
  end


end
