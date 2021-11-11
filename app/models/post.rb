class Post < ApplicationRecord
  belongs_to       :user
  has_many         :comments
  has_one_attached :image

  validates :image ,presence: true

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :amount
  belongs_to :timing

  validates :amount_id, numericality: { other_than: 1 ,message: "が空では登録できません"}
  validates :timing_id, numericality: { other_than: 1 ,message: "が空では登録できません"} 
end
