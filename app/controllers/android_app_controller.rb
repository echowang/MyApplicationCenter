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
		@androidapp = AndroidApp.new(params[:android_app])
  		@androidapp.save
  
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
		@androidapp = AndroidApp.find(params[:id])
  		@androidapp.update_attributes(params[:android_app])
  
  		redirect_to :action => :show, :id => @androidapp
	end

	def destroy
		@androidapp = AndroidApp.find(params[:id])
  		@androidapp.destroy
  
  		redirect_to :action => :index
	end
end
