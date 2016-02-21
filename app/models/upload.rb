class Upload < ActiveRecord::Base
     belongs_to :user
    
      mount_uploader :file , PdfUploader
      acts_as_commontable
end
