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
  should allow_value('person@email.com').for(:email)
  should allow_value('person.name@email.com').for(:email)
  should allow_value('person_name@email.com').for(:email)
  should_not allow_value('person.com').for(:email)
  should_not allow_value('person').for(:email)
  should_not allow_value('person@email..com').for(:email)
  should_not allow_value('person@email,com').for(:email)

  should have_secure_password
  # should validate_length_of(:password).is_equal_to(7)
  should validate_length_of(:password).is_at_least(6)

  def setup
    @valid_user = create(:user)
  end

  test "a user should be valid" do
    assert @valid_user.valid?
  end

  test "an email should be saved as lower-case" do
    assert_equal "test@example.com", @valid_user.email
  end
end
