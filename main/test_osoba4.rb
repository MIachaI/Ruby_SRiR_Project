require 'test/unit'
require_relative 'server/collect_and_compare_programs'

class TestCodeValidator < Test::Unit::TestCase
  # Check situation where there is no folder which contains files
  def test_no_directory
    folderName ='folder'
    assert_match("no folder #{folderName} found!",CollectAndComparePrograms.new().checkFolder(folderName))
  end

  # Check the regular output from known pattern - this only works with files in mp directory
    def test_filesInFilesFolder
        assert_match('Length - how many characters are in file
Height - how many lines this file contains
Complexity - how many methods this file use
Loops - how many loops file contains
Imports - how many files this program requires

File name: test2.txt
File length: 40
Height: 1
Complexity: 0
Loops:0
Imports:0


File name: test1.txt
File length: 1477
Height: 59
Complexity: 8
Loops:2
Imports:0


File name: test3.txt
File length: 1558
Height: 66
Complexity: 9
Loops:0
Imports:0


', CollectAndComparePrograms.new().compareFiles)
    end

  # Check if there is a directory - if there is - the program continues to expected output - this only works with files in mp directory
  def test_thereIsDirectory

      assert_match('Length - how many characters are in file
Height - how many lines this file contains
Complexity - how many methods this file use
Loops - how many loops file contains
Imports - how many files this program requires

File name: test2.txt
File length: 40
Height: 1
Complexity: 0
Loops:0
Imports:0


File name: test1.txt
File length: 1477
Height: 59
Complexity: 8
Loops:2
Imports:0


File name: test3.txt
File length: 1558
Height: 66
Complexity: 9
Loops:0
Imports:0


', CollectAndComparePrograms.new().checkFolder('files'))
  end

  # Check if program counts files correctly - it works with know pattern - such as with mp/files
  def test_countFiles
    folderName ='files'
    assert_equal(3,CollectAndComparePrograms.new().countFiles(folderName))
  end
end
