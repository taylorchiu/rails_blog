# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  sequence :email do |n|
    "email#{n}@factory.com"
  end

  factory :comment do
  	body "comment_body"
  	post "comment_post"
  end

  factory :post do
  	title "post_title"
  	body "post_body"
  end

  factory :user do
    name "lol"
    email
    password "12345678"
    password_confirmation "12345678"
    remember_token "remember_token"
  end

end
