require 'test/unit'
require_relative '../code_tester'

class TestCodeValidator < Test::Unit::TestCase

  def test_empty_file
    assert_equal(true, Code.new(File.open("test_files/empty_file.rb").read).check_syntax)
    assert_equal("", Code.new(File.open("test_files/empty_file.rb").read).code_output)
  end

  def test_empty_code
    assert_equal(false, Code.new(nil).check_syntax)
  end

  def test_simple_code
    assert_equal(
      true,
      Code.new(File.open("test_files/simple_code.rb").read).check_syntax
    )
    # test outputu
    assert_equal(
      "Howdy!\n[\"Dog\", \"Cat\", 10, 43.43]\n\nDodawanie ARG0 (10) i ARG1 (39) = 49\n",
      Code.new(File.open("test_files/simple_code.rb").read).code_output([10, 39])
    )
  end

  # nie chcemy raczej programów gdzie trzeba będzie wprowadzać coś do konsoli w trakcie wykonania programu
  def test_for_no_user_input
    assert_equal(
      false,
      Code.new(File.open("test_files/code_with_user_input.rb").read).check_syntax)
  end
end
