# frozen_string_literal: true

module HexletCode
  class FormBuilder
    attr_reader :form_body, :object

    def initialize(object, options)
      @object = object
      action = options.fetch(:url, '#')
      method = options.fetch(:method, 'post')

      @form_body = {
        inputs: [],
        submit: {},
        form_options: { action:, method: }.merge(options.except(:url, :method))
      }
    end

    def input(name, **options)
      raise NoMethodError, "undefined method `#{name}' for #{@object}" unless @object.respond_to?(name)

      value = @object.public_send(name)
      type = options.delete(:as) || :input
      options[:name] = name
      @form_body[:inputs] << { value:, type:, options: }
    end

    def submit(value = 'Save', options = {})
      options.merge!({ type: 'submit', value: })
      @form_body[:submit] = { options: }
    end
  end
end
