class Sub < ActiveRecord::Base
  validates :title, :description, :creator_id, presence: true
  validates :title, uniqueness: true

  has_many :posts, through: :post_subs

  has_many :post_subs, inverse_of: :sub, dependent: :destroy

  belongs_to :moderator,
    primary_key: :id,
    foreign_key: :creator_id,
    class_name: :User
end
