class HomeController < ApplicationController
  def index
  end
  
  def save
  	unless request.get?   
       if filename=upload_file(params[:file]['file'])   
         render :text=>filename   
       end   
     end
  end
end
