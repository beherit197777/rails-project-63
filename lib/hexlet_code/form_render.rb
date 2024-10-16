# frozen_string_literal: true

require_relative 'inputs/base_input'
require_relative 'inputs/string_input'
require_relative 'inputs/text_input'

module HexletCode
  # Class responsible for rendering the final form
  class FormRenderer
    DEFAULT_COLS = 20
    DEFAULT_ROWS = 40

    def initialize(builded_form)
      @builded_form = builded_form
    end

    def render_html
      form_body = @builded_form.form_body
      inputs = build_inputs(form_body[:inputs])
      submit = build_submit(form_body[:submit])

      HexletCode::Tag.build('form', form_body[:form_options]) { "#{inputs}#{submit}" }
    end

    def build_inputs(inputs)
      inputs.map do |input|
        input_name = input[:type] == :input ? 'String' : input[:type].capitalize # 'Text'
        input_class_name = "HexletCode::Inputs::#{input_name}Input"
        input_class = Object.const_get(input_class_name)

        input_class.build(input[:options], input[:value])
      end.join
    end

    def build_submit(submit)
      return if submit[:options].nil?

      HexletCode::Tag.build('input', submit[:options])
    end
  end
end
