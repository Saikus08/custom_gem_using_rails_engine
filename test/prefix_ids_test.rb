# frozen_string_literal: true

require 'test_helper'

class PrefixIdsTest < ActiveSupport::TestCase
  test 'it has a version number' do
    assert PrefixIds::VERSION
  end

  test 'it prefixes the id' do
    assert_not_nil User.create.prefix_id
  end

  test 'default lenght' do
    assert_equal PrefixIds::MINIMUM_TOKEN_LENGTH + 5, User.create.prefix_id.length
  end

  test 'include prefix' do
    assert User.create.prefix_id.include?('user')
  end
end
