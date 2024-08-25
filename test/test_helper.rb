# frozen_string_literal: true

$LOAD_PATH.unshift File.expand_path('../lib', __dir__)
require 'hexlet_code'

require 'minitest/autorun'
require 'yaml'

def html_assert_equal(expected, result = nil)
  expected = expected.strip
  result = yield if block_given? && result.nil?
  assert_equal expected, result
end

def read_fixture(file_name)
  File.read("#{__dir__}/fixtures/#{file_name}.html").gsub('\n', '')
end
