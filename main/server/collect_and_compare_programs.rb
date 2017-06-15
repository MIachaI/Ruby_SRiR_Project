class CollectAndComparePrograms
=begin
This is basic concept of my part for the SRiR project. It requires just signal
from the main part of the program to start searching for stored files.
Once it found any, it loops for each file in directory and extracting
the data inside. The algorythm looks for end, while and for key words,
and also checks how many lines and characters this code have.
=end


  FileNameTab = []
  FileLengthTab = []
  FileHeightTab = []
  FileComplexityTab =[]
  FileLoopCounterTab =[]
  response =''


# Compare all files in selected input directory
# @Return report (String)

def compareFiles(folderName ='files')
  programLength=0;
  programHeight=0;
  programComplexity=0;
  programLoops=0;
  Dir.foreach(folderName) {

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
      if line.include? "for("
        programLoops+=1;
      end
      if line.include? "for ("
        programLoops+=1;
      end
      programLength += line.length
      programHeight=programHeight+1
    end

    file.close
    FileComplexityTab.push(programComplexity)
    FileHeightTab.push(programHeight)
    FileNameTab.push(currentFile)
    FileLengthTab.push(programLength)
    FileLoopCounterTab.push(programLoops)

    programLength=0;
    programHeight=0;
    programComplexity=0;
    programLoops=0;
  }
counter = CollectAndComparePrograms.new()
  liczba = counter.countFiles(folderName).to_s

      response = liczba +
      " files found in #{folderName} directory\n\n"
          "Length - how many characters are in file\n"+
    "Height - how many lines this file contains\n"+
    "Complexity - how many methods this file use\n"+
    "Loops - how many loops file contains\n\n"
    while (FileNameTab.size!=0)
      response +=

      "File name: "+
      FileNameTab.pop.to_s+"\n"+
      "File length: "+
      FileLengthTab.pop.to_s+"\n"+
      "Height: "+
      FileHeightTab.pop.to_s+"\n"+
      "Complexity: "+
      FileComplexityTab.pop.to_s+"\n"+
      "Loops:"+
      FileLoopCounterTab.pop.to_s+"\n"+
      "\n\n"
      end
  return response
    end



# check if there is invoked folder
  #@return if false - simple information "no folder #{folderName} found!"
  # if true - the method proceed to regular return which is report

def checkFolder(folderName='files')
 if Dir.exist?(folderName)
 proba = CollectAndComparePrograms.new
 response = proba.compareFiles
   return response
 else
   response = "no folder #{folderName} found!"
   return response
 end
end

# this method is to check how many files are in certain directory to compare
  #@return number of files (int)

  def countFiles(folderName='files')
    numberOfFiles=0
    Dir.foreach(folderName){      |currentFile|
      if (currentFile.length<4)
        next;
      end
      numberOfFiles+=1
    }
    return numberOfFiles
  end
end



