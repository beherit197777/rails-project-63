# frozen_string_literal: true

require 'test_helper'

class TestHexletCode < Minitest::Test
  User = Struct.new(:name, :job, :gender, keyword_init: true)

  def setup
    @user = User.new name: 'rob', job: 'hexlet', gender: 'm'
  end

  def test_form_for_with_block
    result = HexletCode.form_for @user do |f|
      f.input :name
      f.input :job, as: :text
    end

    expected = '<form action="#" method="post">
<input name="name" type="text" value="rob">
<textarea name="job" cols="20" rows="40">hexlet</textarea>
</form>'

    assert_equal expected, result
  end

  def test_form_for_with_url_and_additional_attributes
    result = HexletCode.form_for @user, url: '/users' do |f|
      f.input :name, class: 'user-input'
      f.input :job
    end

    expected = '<form action="/users" method="post">
<input name="name" type="text" value="rob" class="user-input">
<input name="job" type="text" value="hexlet">
</form>'

    assert_equal expected, result
  end

  def test_form_for_with_custom_textarea_attributes
    result = HexletCode.form_for @user, url: '#' do |f|
      f.input :job, as: :text, rows: 50, cols: 50
    end

    expected = '<form action="#" method="post">
<textarea name="job" cols="50" rows="50">hexlet</textarea>
</form>'

    assert_equal expected, result
  end

  def test_form_for_with_nonexistent_field
    assert_raises(NoMethodError) do
      HexletCode.form_for @user do |f|
        f.input :age
      end
    end
  end
end
