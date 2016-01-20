class DocumentsController < ApplicationController
  before_filter :authorize, :except => [:index, :show]
  before_action :current_user, :except => [:new, :create]
  before_action :admin_only, :only => [:destroy]


  def index
    @document=Document.all

    @document = Document.search(params[:search])
  end
  def home
    @document=Document.order('updated_at').last(5)
    #Document.last(5).order('id desc')
  end

  def show
    @document=Document.find(params[:id])
  end

  def new
    #render :text => "file has been uploaded successfully"
    @document=Document.new
  end

  def edit
    @document=Document.find(params[:id])
  end
  def download_file
    @document = Document.find(params[:id])
    send_file "#{@document.file_path}"
  end


  def create

    @document = Document.new(doc_params)

    file = params[:document][:dafile] if params[:document].present?
    file1 = params[:document][:file2] if params[:document].present?

    file_name = file.original_filename if file.present?
    image_name = file1.original_filename if file1.present?
    begin
     @document.file_name = file.original_filename
     @document.image_name = file1.original_filename
    rescue
      puts "you have to upload the documents"
      end
    if file_name.present?
      if ([".pdf", ".txt",".docx"].include? File.extname(file_name))
        @document.pathfile(params[:document][:dafile])
      else
        render :text => "upload only pdf files"
        return false
      end
    end

    if image_name.present?

      if ([".png",".gif","jpg"].include? File.extname(image_name))
        @document.path(params[:document][:file2])
      else
        render :text => "upload only png files"
        return false
      end
    end
    if @document.save
      flash[:success] = "Welcome to the Sample Document!"
      redirect_to @document
    else
      render 'new'

    end
  end


  def update
    @document=Document.find(params[:id])

    if @document.update(doc_params)
      redirect_to @document
    else
      render 'edit'
    end
  end

  def destroy
    @document=Document.find(params[:id])
    @document.destroy

    redirect_to documents_path
  end

  private
  def doc_params
    params.require(:document).permit(:dname, :dauthor, :description,:file_path)
  end

end
