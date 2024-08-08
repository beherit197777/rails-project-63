require 'minitest/autorun'
require_relative '../lib/hexlet_code'

class TestHexletCode < Minitest::Test
  User = Struct.new(:name, :job, keyword_init: true)

  def setup
    @user = User.new name: 'rob'
  end

  def test_form_generation_without_url
    expected = '<form action="#" method="post"></form>'
    actual = HexletCode.form_for @user do |f|
    end
    assert_equal expected, actual
  end

  def test_form_generation_with_url
    expected = '<form action="/users" method="post"></form>'
    actual = HexletCode.form_for @user, url: '/users' do |f|
    end
    assert_equal expected, actual
  end
end
