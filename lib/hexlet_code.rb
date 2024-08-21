# frozen_string_literal: true

require_relative 'hexlet_code/tag'
require_relative 'hexlet_code/form_builder'
require_relative 'hexlet_code/form_render'

module HexletCode
  class Error < StandardError; end
  autoload(:FormBuilder, 'hexlet_code/form_builder')
  autoload(:Tag, 'hexlet_code/tag')
  autoload(:FormRenderer, 'hexlet_code/form_render')

  def self.form_for(entity, options = {})
    builded_form = HexletCode::FormBuilder.new(entity, options)
    yield(builded_form) if block_given?

    HexletCode::FormRenderer.new(builded_form).render_html
  end
end
