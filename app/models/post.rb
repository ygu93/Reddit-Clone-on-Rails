class Post < ActiveRecord::Base
  validates :title, :subs, :user_id, presence: true

  has_many :subs, through: :post_subs
  has_many :post_subs, inverse_of: :post, dependent: :destroy
  has_many :comments
  belongs_to :user
end
