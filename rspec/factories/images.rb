FactoryGirl.define do

  factory :image do
    sequence(:title)     { |i| "testuser_#{i}" }
    sequence(:low_url)     { |i| "testuser_#{i}" }
  end

end