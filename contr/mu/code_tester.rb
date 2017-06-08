# @author mu
class Code
  attr_accessor :code
  attr_reader :output, :syntax

  def initialize(code=nil)
    @code = code
    @syntax = false; # syntax variable tells if code provided is correct
  end

  # Sprawdź składnię kodu @code
  # @return kod poprawny ? true : false
  def check_syntax
    if @code != nil
      file = File.new("temp.rb","w")
      file.puts(@code)
      file.close
      code_valid = `ruby -c temp.rb`
      `rm temp.rb`
      # check if @code syntax is correct
      if code_valid == "Syntax OK\n"
        @syntax = true
        return @syntax
      else
        @syntax = false
        return @syntax
      end
    else
      puts "No code provided"
      @syntax = false
      return @syntax
    end
  end

  # zapis kodu do pliku
  # @param filename nazwa pliku
  def save_code_to_file(filename="src.rb")
    file = File.new(filename, "w")
    file.puts(@code)
    file.close
  end

  # wynik działania programu (output w konsoli)
  # @param parameters command line argumenty
  # @return output w konsoli
  def code_output(parameters=nil)
    self.check_syntax
    if @syntax
      file = File.new("temp.rb", "w")
      file.puts(@code)
      file.close

      if parameters.nil?
        @output = `ruby temp.rb`
      else
        par_string = "" # do podstawienia przy wywołaniu skryptu
        parameters.each { |parameter| par_string += " " + parameter.to_s }
        @output = `ruby temp.rb#{par_string}`
      end
      `rm temp.rb`
      return @output
    else
      return "Błąd! Niepoprawna składnia"
    end
  end
end
