class IosAppController < ApplicationController
	
	before_filter :authenticate_user!, :except => [:show, :index]

	def index
		@iosapps = IosApp.all
	end
	def new	
		@iosapp = IosApp.new
		@capacities = AppCapacity.find(:all).map{ |capacity| [capacity.name, capacity.id] } 
	end
	def create
		unless request.get?   
       		filename=upload_file(params[:ios_app]['filename'])   
       		@iosapp = IosApp.new(params[:ios_app])
       		@iosapp.filename = filename
  			@iosapp.save 
     	end

  		redirect_to :action => :index
	end

	def show
		@iosapp = IosApp.find(params[:id])
		@capacity = AppCapacity.find(@iosapp.capacity)
	end

	def edit
		@iosapp = IosApp.find(params[:id])
		@capacities = AppCapacity.find(:all).map{ |capacity| [capacity.name, capacity.id] }
	end

	def update
		unless request.get?
			filename=upload_file(params[:ios_app]['filename'])
			@iosapp = IosApp.find(params[:id])
			@iosapp.filename = filename
  			@iosapp.update_attributes(params[:ios_app])
  		end
  
  		redirect_to :action => :show, :id => @iosapp
	end

	def destroy
		@iosapp = IosApp.find(params[:id])
  		@iosapp.destroy
  
  		redirect_to :action => :index
	end
end
