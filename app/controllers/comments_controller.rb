class CommentsController < ApplicationController
    def new
       @comment = Comment.new 
    end
    def create
       #@commentable_id = Slide.find(params[:id])
       
        @comment =Comment.new
        @comment.commentable_id =params[:id]
        @comment.title =params[:title]
        @comment.comment =params[:comment]
        @comment.user_id = session[:user_id]
        #  @comment = @commentable.comments.new(params[:comment])
        if @comment.save
          redirect_to preview_path(params[:id]), notice: "Comment created."
        else
          render :new
        end
    end
  
end
