require 'test_helper'

class GuestTest < ActiveSupport::TestCase
  should have_db_column(:name)
  should validate_presence_of(:name).on(:create)

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

  should have_db_column(:message)
  should validate_presence_of(:message).on(:create)

  def setup
    @valid_guest = create(:guest)
  end

  test "a guest should be valid" do
    assert @valid_guest.valid?
  end

  test "an guest's email should be saved as lower-case" do
    assert_equal "mavrick@topgun.com", @valid_guest.email
  end
end
