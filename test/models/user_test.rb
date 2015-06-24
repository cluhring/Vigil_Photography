require 'test_helper'

class UserTest < ActiveSupport::TestCase
  # should have_many(:pictures)
  should have_db_column(:first_name)
  should validate_presence_of(:first_name).on(:create)
  should validate_length_of(:first_name).is_at_most(25)


  should have_db_column(:last_name)
  should validate_presence_of(:last_name).on(:create)
  should validate_length_of(:last_name).is_at_most(25)

  should have_db_column(:role)

  should have_db_column(:email)
  should validate_presence_of(:email).on(:create)
  should validate_length_of(:email).is_at_most(50)
  should validate_uniqueness_of(:email)
  should allow_value('person@email.com',
                     'person.name@email.com',
                     'person_name@email.com'
                     ).for(:email)
  should_not allow_value('person@email,com',
                         'person@email',
                         'person.com',
                         'person'
                         ).for(:email)

  should have_secure_password
  # should validate_length_of(:password).is_equal_to(7)
  should validate_length_of(:password).is_at_least(6)
  # should validate_uniqueness_of(:password)

  def setup
    @user = User.create(first_name: "First",
                     last_name: "Last",
                     email: "user@example.com",
                     password: "zoinks!",
                     password_confirmation: "zoinks!")
  end

  test "should be valid" do
    assert @user.valid?
  end
end
