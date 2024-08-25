# frozen_string_literal: true

module HexletCode
  module Inputs
    class StringInput < BaseInput
      def self.build(options, value)
        options[:type] = 'text'
        options[:value] = value
        string_input = HexletCode::Tag.build('input', options)

        label(options[:name]) + string_input
      end
    end
  end
end
