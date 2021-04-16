class Product < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :user
  
  # コメント行 :追加実装で使う可能性があるので残してます。
  #belongs_to :category, dependent: :destroy
  #belongs_to :brand, dependent: :destroy
  #has_many :comments, dependent: :destroy

  has_one :order
  
  has_one_attached :image
  belongs_to :shipping_area
  belongs_to :category
  belongs_to :shipping_change
  belongs_to :condition
  belongs_to :delivery_time

  with_options presence: true do
    validates :image
    validates :name
    validates :description
  end

  with_options presence: true, numericality: { other_than: 0 } do
    validates :category_id
    validates :condition_id
    validates :shipping_change_id
    validates :shipping_area_id
    validates :delivery_time_id
  end

  validates :price,              presence: true, numericality: {only_integer:true,greater_than_or_equal_to:300,less_than_or_equal_to:9999999}

 end

