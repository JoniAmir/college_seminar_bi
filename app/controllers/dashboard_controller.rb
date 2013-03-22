class DashboardController < ApplicationController
	before_filter :require_login, :only => :index

	# Display the home page
	def home

	end


	# Show all the general graphs and statistics
	def show_dashboard

	end


	# About page
	def about

	end




end
