class Review < ApplicationRecord
  belongs_to :movie
  belongs_to :member
  has_many :comment
  has_many :favorites, dependent: :destroy
    
  validates :title, presence: true
  validates :impression, presence: true
  # validates :star, presence: true
    
  def favorited?(member)
    favorites.where(member_id: member).exists?
  end
end
