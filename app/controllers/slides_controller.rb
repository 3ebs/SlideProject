class SlidesController < ApplicationController

    def index
     
      @uploads = Upload.find_by_id(params[:id])
      @slides = Slide.all
    
    end
    
    def comments
        
    end
    
    def show
        @slide=Slide.find_by_id(params[:id])
        #commontator_thread_show(@slide)
        @comments= Comment.all
        @commentable = @slide
        #@comments = @slide.comments
        @comment = Comment.new
    end
    
	
end
