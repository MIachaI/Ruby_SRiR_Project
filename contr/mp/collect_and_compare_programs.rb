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
  FileComplexityTab =[]
# Compare all files in selected input directory
# @Return Report.txt as summary
public def compareFiles()
  programLength=0;
  programHeigth=0;
  programComplexity=0;
  Dir.foreach("testFolder") {

      |currentFile|
    if (currentFile.length<4)
      next;

    end
    puts "Opening: #{currentFile}"
    puts "Extracting..."
    file = File.new("testFolder/#{currentFile}", "r")
    while (line = file.gets)

      if line.include? "end"
        programComplexity+=1
      end
      programLength += line.length
      programHeigth=programHeigth+1
    end
    puts "Closing file #{currentFile}\n\n"

    file.close
    FileComplexityTab.push(programComplexity)
    FileHeightTab.push(programHeigth)
    FileNameTab.push(currentFile)
    FileLengthTab.push(programLength)

    programLength=0;
    programHeigth=0;
    programComplexity=0;
  }

  open('report.txt', 'w') do |f|
    f.printf("Length - how many characters are in file\n")
    f.printf("Height - how many lines this file contains\n")
    f.printf("Complexity - how many methods this file use\n\n")
    while (FileNameTab.size!=0)
    f.printf("File name: ")
    f.puts(FileNameTab.pop)
    f.printf("File length: ")
    f.puts(FileLengthTab.pop)
    f.printf("Height: ")
    f.puts(FileHeightTab.pop)
    f.printf("Complexity: ")
    f.puts(FileComplexityTab.pop)
    f.puts("\n\n")
   end
  end
end
end

testObject = CollectAndComparePrograms.new()
testObject.compareFiles