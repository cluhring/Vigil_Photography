FactoryGirl.define do
  factory :user do
    first_name "John"
    last_name  "Doe"
    email "test@example.com"
    password "password"
    password_confirmation "password"
  end

  factory :invalid_user, :class => "User" do
    first_name "Jack"
    last_name  "Dope"
    email "dopey@example.com"
    password "pass"
    password_confirmation "pass"
  end
end
