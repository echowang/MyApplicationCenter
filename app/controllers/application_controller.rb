class ApplicationController < ActionController::Base
  protect_from_forgery

  def configure_charsets   
     @headers["Content-Type"]="text/html;charset=utf-8"  
  end

  def upload_file(file)   
     if !file.original_filename.empty?   
       @filename=get_file_name(file.original_filename)    
       File.open("#{Rails.root}/public/images/#{@filename}", "wb") do |f|   
       f.write(file.read)   
       end   
       return @filename  
     end   
  end

  def get_file_name(filename)   
     if !filename.nil?   
       Time.now.strftime("%Y_%m_%d_%H_%M_%S") + '_' + filename   
     end   
  end

end
