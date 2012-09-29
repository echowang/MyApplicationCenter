class AndroidApp < ActiveRecord::Base
  attr_accessible :capacity, :description, :name, :filename
end
