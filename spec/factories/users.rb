FactoryGirl.define do
  factory :user do
    email "test@test.com"
    password "dummypassword"
    name "test_name"
    surname "test_surname"
    phone_number "0640182685"
    age 21
  end

  # This will use the User class (Admin would have been guessed)
  # factory :admin, class: User do
  #   name "Admin"
  #   surname  "User"
  # end
end