class DashboardController < ApplicationController
	before_filter :require_login, :only => :index

	# Display the home page
	def home

	end


	# Show all the general graphs and statistics
	def index

	end


	# About page
	def about

	end




end
