require 'test/unit'
require_relative '../code_tester'
require_relative '../comm'

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

  def test_incorrect_code
    assert_equal(
      false,
      Code.new(File.open("test_files/incorrect_code.rb").read).check_syntax
    )
  end

  # Message class tests
  def test_message_generator
    assert_equal(
      "<text>This is the code</text>\n<param>those are params 5</param>",
      Message.new("This is the code",["those", "are", "params", 5]).generate_message
    )
  end

  def test_get_vals
    pattern = Message.new("This is code",["those", "are", "params"])
    msg = Message.new().get_vals("<text>This is code</text><trash>trash</trash><param>those are params</param>")
    # sprawdź czy tekst (kod) jest wczytywany prawidłowo
    assert_equal(pattern.text, msg.text)

    # sprawdź czy parametry są wczytywane prawidłowo
    assert_equal(pattern.parameters, msg.parameters)
  end

  def test_empty_vals
    pattern = Message.new(nil,nil)
    msg = Message.new().get_vals("Test code tihs one <text><param>")
    assert_equal(pattern.text, msg.text)
    assert_equal(pattern.parameters, msg.parameters)
  end
end
