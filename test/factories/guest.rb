FactoryGirl.define do
  factory :guest do
    name "Pete Mitchell"
    email "mavrick@topgun.com"
    message "Take me to bed, or lose me forever."
  end

  # factory :invalid_user, :class => "User" do
  #   first_name "Jack"
  #   last_name  "Dope"
  #   email "dopey@example.com"
  #   password "pass"
  #   password_confirmation "pass"
  # end
end
