class HomeController < ApplicationController
  def index
  	@iosapps = IosApp.all 
  	respond_to do |format|
  	  format.html
  	  format.xml { render :xml => @iosapps } 
      format.json { render :text => @iosapps.to_json }  
    end
  end
  
  def save
  	unless request.get?   
       if filename=upload_file(params[:file]['file'])   
         render :text=>filename   
       end   
     end
  end
end
