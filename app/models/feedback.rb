class Feedback

  include ActiveModel::Model

  attr_accessor :body, :title, :email

  validates :title, presence: true
  validates :body, presence: true
  validates :email, presence: true

end
