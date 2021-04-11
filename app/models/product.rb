class Product < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :user, dependent: :destroy
  belongs_to :category, dependent: :destroy
  #belongs_to :brand, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_one :order
  has_one_attached :image
  belongs_to :shipping_area
  belongs_to :category
  belongs_to :shipping_change
  belongs_to :condition
  belongs_to :delivery_time

  validates :image,              presence: true
  validates :name,               presence: true
  validates :description,        presence: true
  validates :condition_id,       presence: true, numericality: { other_than: 0 }
  validates :shipping_change_id, presence: true, numericality: { other_than: 0 }
  validates :shipping_area_id,   presence: true, numericality: { other_than: 0 }
  validates :delivery_time_id,   presence: true, numericality: { other_than: 0 }
  validates :price,              presence: true, numericality: {only_integer:true,greater_than_or_equal_to:300,less_than_or_equal_to:9999999}
  validates :category_id,        presence: true, numericality: { other_than: 0 }
  
  
end
