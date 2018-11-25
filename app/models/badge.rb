class Badge < ApplicationRecord
  validates :title, :img_address, presence: true

  has_many :badge_reception, dependent: :destroy
  has_many :users, through: :badge_reception
  belongs_to :author, class_name: 'User', optional: true

end
