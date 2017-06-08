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
  programHeigth=0;

  Dir.foreach("testFolder") {

      |currentyFile|
    if (currentyFile.length<4)
      next;

    end
    puts "Opening: #{currentyFile}..."
    puts "Extracting..."
    file = File.new("testFolder/#{currentyFile}", "r")
    while (line = file.gets)
      puts "#{line}"
      programLength += line.length
      programHeigth=programHeigth+1
    end
    file.close
    FileHeightTab.push(programHeigth)
    FileNameTab.push(currentyFile)
    FileLengthTab.push(programLength)

    programLength=0;
    programHeigth=0;
  }
  while(FileNameTab.size!=0)
    puts "\nExecution successful."
    printf("File name: ")
    puts(FileNameTab.pop)
    printf("File length: ")
    puts(FileLengthTab.pop)
    printf("File height: ")
    puts(FileHeightTab.pop)
  end
end
