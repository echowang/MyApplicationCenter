class AndroidAppController < ApplicationController

	before_filter :authenticate_user!, :except => [:show, :index]

	def index
		@androidapps = AndroidApp.all
	end
	def new	
		@androidapp = AndroidApp.new
		@capacities = AppCapacity.find(:all).map{ |capacity| [capacity.name, capacity.id] } 
	end
	def create
		unless request.get?
			filename=upload_file(params[:android_app]['filename'])

			@androidapp = AndroidApp.new(params[:android_app])
			@androidapp.filename = filename
  			@androidapp.save
  		end

  		redirect_to :action => :index
	end

	def show
		@androidapp = AndroidApp.find(params[:id])
		@capacity = AppCapacity.find(@androidapp.capacity)
	end

	def edit
		@androidapp = AndroidApp.find(params[:id])
		@capacities = AppCapacity.find(:all).map{ |capacity| [capacity.name, capacity.id] }
	end

	def update
		filename=upload_file(params[:android_app]['filename'])
		@androidapp = AndroidApp.find(params[:id])
		
		hash = Hash.new
		hash['name'] = params[:android_app]['name']
		hash['description'] = params[:android_app]['description']
		hash['capacity'] = params[:android_app]['capacity']
		hash['filename'] = filename
  		
  		@androidapp.update_attributes(hash)
  
  		redirect_to :action => :show, :id => @androidapp
	end

	def destroy
		@androidapp = AndroidApp.find(params[:id])
  		@androidapp.destroy
  
  		redirect_to :action => :index
	end
end
