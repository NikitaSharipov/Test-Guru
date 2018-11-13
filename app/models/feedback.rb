class Feedback

  include ActiveModel::Model

  attr_accessor :body, :title, :email

  validates :title, :body, :email, presence: true

end
