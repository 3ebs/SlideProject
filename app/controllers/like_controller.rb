class LikeController < ApplicationController
    
    def like
        @liker=Liker.find_by_user_id(params [:user_id])
        @faa=@liker.find_by_slide_id(params [:slide_id])
    if (!(@liker) && !@faa)
        
        @like =Liker.new
        @like.slide_id =params[:id]
        @like.user_id =params[:user_id]
        
            if @like.save
              redirect_to preview_path(params[:id]), notice: "like created."
            else
              render :new
            end
            
    end
    
    def unlike
        
    end
end
