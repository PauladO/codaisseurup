FactoryGirl.define do
  factory :registration do
    user nil
    event nil
    price "9.99"
    status "MyString"
    guest_count 1
  end
end
