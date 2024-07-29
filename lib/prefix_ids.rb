# frozen_string_literal: true

require 'prefix_ids/version'
require 'prefix_ids/railtie'

module PrefixIds
  MINIMUM_TOKEN_LENGTH = 24

  module Attribute
    class MinimumLengthError < StandardError; end

    extend ActiveSupport::Concern

    module ClassMethods
      def has_prefix_id(prefix, attribute: :prefix_id, length: MINIMUM_TOKEN_LENGTH)
        # Load securerandom only when has_secure_token is used.
        require 'active_support/core_ext/securerandom'
        define_method("regenerate_#{attribute}") { update! attribute => self.class.generate_unique_prefix_id(prefix, length: length) }
        before_create { send("#{attribute}=", self.class.generate_unique_prefix_id(prefix, length: length)) unless send("#{attribute}?") }
      end

      def generate_unique_prefix_id(prefix, length: MINIMUM_TOKEN_LENGTH)
        "#{prefix}_#{SecureRandom.base58(length)}"
      end
    end
  end
end
