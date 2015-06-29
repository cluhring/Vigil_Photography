ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'
require 'minitest/autorun'
require 'minitest/emoji'
require 'capybara/rails'

class ActiveSupport::TestCase
  fixtures :all
  include ApplicationHelper
  include FactoryGirl::Syntax::Methods
  # Add more helper methods to be used by all tests here...
end
