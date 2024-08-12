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
  class FormBuilder
    def initialize(object)
      @object = object
      @inputs = []
      @submit = nil
    end

    def input(name, **options)
      unless @object.respond_to?(name)
        raise NoMethodError, "undefined method `#{name}' for #{@object}"
      end

      value = @object.public_send(name)
      type = options.delete(:as) || :input
      @inputs << { name: name, value: value, type: type, options: options }
    end

    def submit(value = 'Save')
      @submit = value
    end

    def to_html
      html = "<form action=\"#{@url}\" method=\"#{@method}\">"
      @inputs.each do |input|
        html += "\n#{build_input(input)}"
      end
      html += "\n#{build_submit}" if @submit
      html += "\n</form>"
      html
      end
    end

    private

    def build_input(input)
      attrs = { name: input[:name], type: 'text', value: input[:value] }.merge(input[:options])
      "<input #{attrs_to_string(attrs)}>"
    end

    def build_textarea(input)
      attrs = { name: input[:name], cols: 20, rows: 40 }.merge(input[:options])
      "<textarea #{attrs_to_string(attrs)}>#{input[:value]}</textarea>"
    end

    def build_submit
      '<input type=\\"submit\\" value=\\"#{@submit}\\">'
    
      def attrs_to_string(attrs)
        attrs.map { |k, v| "#{k}=\"#{v}\"" }.join(' ')
    end

  def self.form_for(object, **options)
    form_attrs = { action: options[:url] || '#', method: 'post' }
    form_builder = FormBuilder.new(object)
    yield(form_builder)
    "<form #{form_builder.send(:attrs_to_string, form_attrs)}>\\n#{form_builder.to_html}\\n</form>"
  end
end