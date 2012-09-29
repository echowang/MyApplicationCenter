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
       		if filename=upload_file(params[:file]['file'])   
         		  
       		end   
     	end

		# @iosapp = IosApp.new(params[:ios_app])
  # 		@iosapp.save
  
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
		@iosapp = IosApp.find(params[:id])
  		@iosapp.update_attributes(params[:ios_app])
  
  		redirect_to :action => :show, :id => @iosapp
	end

	def destroy
		@iosapp = IosApp.find(params[:id])
  		@iosapp.destroy
  
  		redirect_to :action => :index
	end
end
