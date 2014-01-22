# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :presente do
    nome "MyString"
    valor "9.99"
    foto "MyString"
    url "MyString"
    lista nil
  end
end
