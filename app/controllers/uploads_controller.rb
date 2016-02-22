class UploadsController < ApplicationController
  before_action :set_upload, only: [:show, :edit, :update, :destroy]
  before_action :require_user, only: [:index, :show]

  # GET /uploads
  # GET /uploads.json
  def index
  @uploads = Upload.all
  @slides=Slide.all
  end

  # GET /uploads/1
  # GET /uploads/1.json
  def show
      redirect_to '/uploads'
  end

  # GET /uploads/new
  def new
    @upload = Upload.new
  end
  
  
  # GET /uploads/1/edit
  def edit
  end
 $imagecounter=0
  def convert(uri)
     uri ="public#{uri}"
     #pdf = Magick::ImageList.new(uri)
     
     im = Magick::Image.read(uri)
     pdf = Magick::ImageList.new(uri)
     
     pdf.each_with_index do |element ,i| 
      element.write(uri +"#{i}"+".jpg")
      
      $imagecounter="#{i}"
     end
     # pdf.each_with_index do |page_img, i|
        
     # page_img.write "#{i}_pdf_page.jpg"
       
     #end
     
   
  end
  # POST /uploads
  # POST /uploads.json
  def create
    @upload = Upload.new(upload_params)
    @upload.file = params[:file] # Assign a file like this, or
    @upload.user_id = session[:user_id]
    @upload.counter_a = $imagecounter
    
        
     
    respond_to do |format|
      if @upload.save
         urii = @upload.file
         urii="#{urii}"
         uri ="public#{urii}"
         im = Magick::Image.read(uri)
         pdf = Magick::ImageList.new(uri)
         
         pdf.each_with_index do |element ,i| 
          element.write(uri +"#{i}"+".jpg")
          @slide= Slide.new()
          @slide.user_id = session[:user_id]
          @slide.upload_id = @upload.id
          @slide.url =urii +"#{i}"+".jpg"
          @slide.save
         end
        format.html { redirect_to @upload, notice: 'Upload was successfully created.' }
        format.json { render :show, status: :created, location: @upload }
      else
        format.html { render :new }
        format.json { render json: @upload.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /uploads/1
  # PATCH/PUT /uploads/1.json
  def update
    respond_to do |format|
      if @upload.update(upload_params)
        format.html { redirect_to @upload, notice: 'Upload was successfully updated.' }
        format.json { render :show, status: :ok, location: @upload }
      else
        format.html { render :edit }
        format.json { render json: @upload.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /uploads/1
  # DELETE /uploads/1.json
  def destroy
    @upload.destroy
    respond_to do |format|
      format.html { redirect_to uploads_url, notice: 'File was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_upload
      @upload = Upload.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def upload_params
      params.require(:upload).permit(:file)
    end
end
