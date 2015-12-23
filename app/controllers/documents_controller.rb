class DocumentsController < ApplicationController
  before_filter :authenticate_user!, :except => [:index, :show]



  def index
    @document=Document.all
    #render :file => 'home\Project1\public\data'
    
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

   #def uploadFile
   #  document = Document.save(params[:upload])
   #end
  
   def create 
   
     @document=Document.new(doc_params)
      @document.pathfile(params[:upload]) 
     if @document.save
     redirect_to documents_path
     else
     render 'new'                           
    end
   end

   def pathfile(params)
   document = @document.upload(params[:upload])
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
   params.require(:document).permit(:dname, :dauthor, :description, :tname, :file_path)
  end

end
