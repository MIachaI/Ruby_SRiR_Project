# Author: Basia Ścibior

class ExecuteProgram

  # executes recieved code and saves it to a variable
  @result = `ruby files/program.rb`

  # saves result to file and returns it
  def self.save_code(filename="result.rb")
    directory_name = "result"
    Dir.mkdir(directory_name) unless File.exists?(directory_name)
    file = File.new(directory_name + "/" + filename, "w")
    file.puts(@result)
    file.close
    return @result
  end

  ExecuteProgram.save_code("result.rb")

end