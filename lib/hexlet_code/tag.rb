# frozen_string_literal: true

module HexletCode
  # Module for generating HTML tags
  module Tag
    SINGLE_TAGS = %w[br hr img input wbr].freeze

    def self.build(tag_name, attributes = {})
      attributes_string = attributes.map { |key, value| "#{key}=\"#{value}\"" }.join(' ')

      tag_name = tag_name.to_s.downcase
      result = "<#{tag_name} #{attributes_string}>"

      return result if SINGLE_TAGS.include?(tag_name)

      "<#{tag_name} #{attributes_string}>#{yield if block_given?}</#{tag_name}>"
    end
  end
end
