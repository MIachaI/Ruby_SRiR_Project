class CollectAndComparePrograms
=begin
This is basic concept of my part for the SRiR project. It requires just signal
from the main part of the program to start searching for stored files.
Once it found any, it loops for each file in directory and extracting
the data inside. I will implement comparision algorythm later.
=end
  FileNameTab = []
  FileLengthTab = []
  FileHeightTab = []
  programLength=0;
  i=0;

  Dir.foreach("testFolder") {

      |x|
    if (x.length<4)
      next;

    end
    puts "Opening: #{x}..."
    puts "Extracting..."
    file = File.new("testFolder/#{x}", "r")
    while (line = file.gets)
      puts "#{line}"
      programLength += line.length
      i=i+1
    end
    file.close
    FileHeightTab.push(i)
    FileNameTab.push(x)
    FileLengthTab.push(programLength)

    programLength=0;
    i=0;
  }
  puts "\nExecution successful."
  puts FileNameTab
  puts FileLengthTab
  puts FileHeightTab
  end
