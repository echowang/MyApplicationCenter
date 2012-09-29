class AppCapacityController < ApplicationController

	before_filter :authenticate_user!, :except => [:show, :index]
	
	def index
		@capacities = AppCapacity.all
	end

	def show
		@capacity = AppCapacity.find(params[:id])
	end

	def edit
		@capacity = AppCapacity.find(params[:id])
	end

	def destroy
		@capacity = AppCapacity.find(params[:id])
  		@capacity.destroy
  
  		redirect_to :action => :index
	end

	def new
		@capacity = AppCapacity.new
	end

	def create
		@capacity = AppCapacity.new(params[:app_capacity])
  		@capacity.save
  
  		redirect_to :action => :index
	end

	def update
  		@capacity = AppCapacity.find(params[:id])
  		@capacity.update_attributes(params[:app_capacity])
  
  		redirect_to :action => :show, :id => @capacity
	end
end
