
require 'fileutils'
class FolderManagement
  #this method provides deleting old files sent to store directory
  #@return void - it just makes folder empty

  def deleteFiles(folderName = 'files')
    FileUtils.rm_rf(Dir.glob("../mu/#{folderName}/*"))
  end
end