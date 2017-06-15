# @author mu
class Message
  attr_accessor :text, :parameters

  def initialize(text=nil, parameters=nil)
    @text = text
    @parameters = parameters
  end

  # generuje tekst do wysłania w odpowiednich tagach <text></text> i <param></param> <br/>
  # parametry w tagach param są oddzielone od siebie spacjami
  # @return tekst (np. kod) i parametry otoczone odpowiednimi tagami
  def generate_message
    result = "<text>#{@text}</text>"
    result += "\n<param>#{@parameters.join(" ")}</param>"
    return result
  end

  # odczytuje kod i parametry zawarte pomiędzy odpowienimi tagami (<text>, <param>)
  # @return self
  def get_vals(message)
    @text = message.match("<text>(.+)</text>")[1] rescue nil
    @parameters = message.match("<param>(.+)</param>")[1].split(" ") rescue nil
    return self
  end
end
