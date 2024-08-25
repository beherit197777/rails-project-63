# frozen_string_literal: true

module HexletCode
  module Inputs
    # Class for rendering text area input fields
    class TextInput < BaseInput
      COLS = 20
      ROWS = 40

      def self.build(options, value)
        textarea = HexletCode::Tag.build('textarea', { cols: COLS, rows: ROWS }.merge(options)) { value }
        label(options[:name]) + textarea
      end
    end
  end
end
