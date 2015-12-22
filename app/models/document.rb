class Document < ActiveRecord::Base
	belongs_to :team
	has_and_belongs_to_many :clients
	validates :dname, :dauthor, :description, :presence => true
	def pathfile(upload)

    name = upload[:dafile].original_filename
    directory = "#{Rails.root}/public/data/"
    # create the file path
    path = File.join(directory,name)
    self.file_path = path
  
    # write the file
    File.open(path, "wb") { |f| f.write(upload[:dafile].read) }
    
  end
end


