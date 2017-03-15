FactoryGirl.define do
  factory :event do
    name              { Faker::Lorem.word }
    description       { Faker::Lorem.sentence(40) }
    location          { Faker::Address.city }
    price             { Faker::Commerce.price }
    capacity          100

     includes_food     true
     includes_drinks   false

     starts_at         10.days.from_now
     ends_at           12.days.from_now

     user              { build(:user) }

     trait :active do
       active true
     end

     trait :inactive do
       active false
     end
   end
end
