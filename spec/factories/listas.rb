# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :lista do
    nome "MyString"
    presenteados "MyString"
    descricao "MyText"
    foto "MyString"
    user nil
  end
end
