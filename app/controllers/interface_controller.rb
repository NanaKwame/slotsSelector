require 'rubygems'
require 'json'

class InterfaceController < ApplicationController
	
	def index
		limit = Selector.find( :all, :order =>'"timesSelected" desc', :limit => 1)[0].timesSelected
		lucky = Selector.where('"timesSelected" !='+limit.to_s)
		if lucky.length != 0 
			if params["exclude"] != nil
				lucky.where("id NOT IN ("+params["exclude"].join(",")+")")
			end
		else
			if params["exclude"] != nil
				lucky = Selector.where("id NOT IN ("+params["exclude"].join(",")+")")
			else
				lucky = Selector.all
			end
		end
		@choices = lucky
	end
end
