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
  FileLoopCounterTab =[]
# Compare all files in selected input directory
# @Return Report.txt as summary
public string def compareFiles()
  programLength=0;
  programHeigth=0;
  programComplexity=0;
  programLoops=0;


  Dir.foreach("files") {

      |currentFile|
    if (currentFile.length<4)
      next;

    end
    file = File.new("files/#{currentFile}", "r")
    while (line = file.gets)

      if line.include? "end"
        programComplexity+=1
      end
      if line.include? "while ("
        programLoops+=1
      end
      if line.include? "while("
        programLoops+=1;
      end
      programLength += line.length
      programHeigth=programHeigth+1
    end

    file.close
    FileComplexityTab.push(programComplexity)
    FileHeightTab.push(programHeigth)
    FileNameTab.push(currentFile)
    FileLengthTab.push(programLength)
    FileLoopCounterTab.push(programLoops)

    programLength=0;
    programHeigth=0;
    programComplexity=0;
    programLoops=0;
  }
string response

      response =
          "Length - how many characters are in file\n"+
    "Height - how many lines this file contains\n"+
    "Complexity - how many methods this file use\n"+
    "Loops - how many loops file contains\n\n"
    while (FileNameTab.size!=0)
      response +=

      "File name: "+
      FileNameTab.pop+
      "File length: "+
      FileLengthTab.pop+
      "Height: "+
      FileHeightTab.pop+
      "Complexity: "+
      FileComplexityTab.pop+
      "Loops:"+
      FileLoopCounterTab.pop+
      "\n\n"
    end

end
  return response
  end


