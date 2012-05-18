FactoryGirl.define do
  factory :location do
    association :whitelabel
    name "Blau Mobilfunk GmbH"
    url "http://www.blaumobilfunk.de"
    street "Schanzenstr."
    house_number "85"
    city "Hamburg"
    zip "20357"
    lat 53.56544
    long 9.95947
  end
end
