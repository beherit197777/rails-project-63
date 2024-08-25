# frozen_string_literal: true

require_relative 'test_helper'

class TestHexletCode < Minitest::Test
  def setup
    @user = Struct.new(:name, :job, :gender, keyword_init: true)

    @current_user = @user.new name: 'rob', job: 'hexlet', gender: 'm'
  end

  def test_that_it_has_a_version_number
    refute_nil ::HexletCode::VERSION
  end

  def test_simple_form
    expected = read_fixture('form')

    result = HexletCode.form_for(@current_user)

    assert_equal expected, result
  end

  def test_form_with_url
    expected = read_fixture('form_with_url')
    result = HexletCode.form_for(@current_user, url: '/users')
    assert_equal expected, result
  end

  def test_form_with_additional_attributes
    expected = read_fixture('form_with_additional_attributes')
    result = HexletCode.form_for @current_user, url: '/profile', method: :get, class: 'hexlet-form', &:submit
    assert_equal expected, result
  end

  def test_form_with_input
    expected = read_fixture('form_with_input')

    result = HexletCode.form_for @current_user do |f|
      f.input :name
      f.input :job
    end
    assert_equal expected, result
  end

  def test_form_with_as_option
    expected = read_fixture('form_with_as_option')

    result = HexletCode.form_for @current_user do |f|
      f.input :name
      f.input :job, as: :text
    end
    assert_equal expected, result
  end

  def test_form_with_additional_input_attributes
    expected = read_fixture('form_with_additional_input_attributes')

    result = HexletCode.form_for @current_user do |f|
      f.input :name, class: 'user-input'
      f.input :job
    end
    assert_equal expected, result
  end

  def test_form_with_submit
    expected = read_fixture('form_with_submit')

    result = HexletCode.form_for @current_user do |f|
      f.input :name
      f.input :job
      f.submit
    end
    assert_equal expected, result
  end

  def test_form_with_submit_value
    expected = read_fixture('form_with_submit_value')

    result = HexletCode.form_for @current_user do |f|
      f.input :name
      f.input :job
      f.submit 'Wow'
    end
    assert_equal expected, result
  end

  def test_from_wiht_labels
    expected = read_fixture('form_with_labels')

    result = HexletCode.form_for @current_user do |f|
      f.input :name
      f.input :job
      f.submit
    end
    assert_equal expected, result
  end

  def test_raise_missing_method
    assert_raises NoMethodError do
      HexletCode.form_for @current_user, url: '/users' do |f|
        f.input :name
        f.input :job, as: :text
        f.input :age
      end
    end
  end
end
