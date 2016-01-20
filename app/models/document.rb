class Document < ActiveRecord::Base
  belongs_to :team
  has_and_belongs_to_many :clients
  validates :dname, :dauthor, :description, :presence => true
  #validate :file_format, :if => 'file?'
  #validates_format_of :dafile, :with =>/\.(pdf|docx|doc|txt|html)/

  def pathfile(upload)

    name = upload.original_filename
    directory = "#{Rails.root}/public/data/"
    # create the file path
    path = File.join(directory,name)
    self.file_path = path

    # write the file
    File.open(path, "wb") { |f| f.write(upload.read) }
  end


  def path(upload)

    name = upload.original_filename
    directory = "#{Rails.root}/public/data/"
    # create the file path
    path = File.join(directory,name)
    #self.image_name = path

    # write the file
    File.open(path, "wb") { |f| f.write(upload.read) }
  end




  # def self.search(search)
  #if search
  #find(:all, :conditions => ['dname LIKE ?', "%#{search}%"])
  #else
  # find(:all)
  #end
  #end

  def self.search(search)
    # where(:title, query) -> This would return an exact match of the query
    where("dname || dauthor like ?", "%#{search}%")

  end
end



