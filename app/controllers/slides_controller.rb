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
    
	def comment
		commentable = Slide.find(params[:id])
		comment = commentable.comment.create
		comment.title = params[:title]
		comment.comment = params[:comment]
		comment.user = @current_user
		comment.save
		redirect_to page_url(commentable)
	end
end
