# frozen_string_literal: true

require_relative 'hexlet_code/version'

module HexletCode
  class Error < StandardError; end
  autoload :Tag, "#{__dir__}/hexlet_code/tag"
  autoload :FormBuilder, "#{__dir__}/hexlet_code/form_builder"
  autoload :FormRenderer, "#{__dir__}/hexlet_code/form_render"
  autoload :Inputs, "#{__dir__}/hexlet_code/inputs"

  def self.form_for(entity, options = {})
    builded_form = HexletCode::FormBuilder.new(entity, options)
    yield(builded_form) if block_given?

    HexletCode::FormRenderer.new(builded_form).render_html
  end
end
