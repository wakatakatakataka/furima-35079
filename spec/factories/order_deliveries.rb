FactoryBot.define do
  factory :order_delivery do
    zip_code         {'123-4567'}
    shipping_area_id {1}
    city             {'東京都'}
    address          {'東京1-1-1'}
    building_name    {'柳ビル103'}
    telephone        {'09012345678'}
    token            {"tok_abcdefghijk00000000000000000"}
  end
end
