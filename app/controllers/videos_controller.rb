class VideosController < ApplicationController
	before_action :set_video, only: [:show]

	def index
		#@videos = Video.all
		@categories = Category.all
	end

	def show
	end

	private

	def set_video
		@video = Video.find_by(params[:id])
	end

end