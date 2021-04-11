FactoryBot.define do
  factory :product do
    name                  {"test"}
    description           {Faker::Lorem.sentence}
    category_id           {1}
    condition_id          {1}
    shipping_change_id    {1}
    shipping_area_id      {1}
    delivery_time_id      {1}
    price                 {300}

    after(:build) do |product|
      product.image.attach(io: File.open('public/images/sample.jpeg'), filename: 'sample.jpeg')
    end
  end
end
