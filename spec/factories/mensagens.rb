# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :mensagem do
    remetente "MyString"
    texto "MyText"
    presente nil
  end
end
