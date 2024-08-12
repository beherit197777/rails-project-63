# frozen_string_literal: true

require_relative 'hexlet_code/version'

module HexletCode
  class Error < StandardError; end

  module Tag
    def self.build(tag_name, attributes = {})
      attributes_string = attributes.map { |key, value| "#{key}=\\'#{value}\\"" }.join(' ')
      '<#{tag_name} #{attributes_string}></#{tag_name}>"
  end

  class << self
    def form_for(entity, options = {})
      url = options[:url] || '#'
      form_builder = FormBuilder.new(entity)
      yield(form_builder) if block_given?
      "<form action=\"#{url}\" method=\"post\">#{form_builder.to_html}</form>"
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
      html = @inputs.map { |input| build_input(input) }.join("\\n")
      html += "\\n#{build_submit}" if @submit
      html
    end

    private

    def build_input(input)
      if input[:type] == :textarea
        build_textarea(input)
      else
        attrs = { name: input[:name], type: 'text', value: input[:value] }.merge(input[:options])
        "<input #{attrs_to_string(attrs)}>"
      end
    end

    def build_textarea(input)
      attrs = { name: input[:name], cols: 20, rows: 40 }.merge(input[:options])
      "<textarea #{attrs_to_string(attrs)}>#{input[:value]}</textarea>"
    end

    def build_submit
      '<input type=\\"submit\\" value=\\"#{@submit}\\'
    end  
    
    def attrs_to_string(attrs)
      attrs.map { |k, v| "#{k}=\\'#{v}\\"" }.join(' ')
    end
  end
end