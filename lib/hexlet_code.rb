# frozen_string_literal: true

require_relative 'hexlet_code/version'

module HexletCode
  class Error < StandardError; end

  module Tag
    def self.build(tag_name, attributes = {})
      attributes_string = attributes.map { |key, value| "#{key}=\"#{value}\"" }.join(' ')
      "<#{tag_name} #{attributes_string}></#{tag_name}>"
    end
  end

  class << self
    def form_for(_entity, options = {})
      url = options[:url] || '#'
      Tag.build('form', action: url, method: 'post')
    end
  end
end
