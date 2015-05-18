class SubmoodsController < ApplicationController
 	before_action :load_mood
  	before_action :set_submood, only: [:show, :edit, :update, :destroy]

	def index
    	@submoods = @mood.submoods
  	end

  	def new
  		@submood = @mood.submoods.build
  	end

	def create
		#@mood = Mood.find(params[:mood_id])
		#puts "Mood #{params[:mood_id]}"
		#puts "submood #{params[:submood]}"
		@submood = @mood.submoods.create!(submood_params)
		redirect_to @mood
	end

	private
	def load_mood
		@mood = Mood.find(params[:mood_id])
	end

	def set_submood
		@submood = @mood.submoods.find(params[:id])
	end

	def submood_params
		params.require(:submood).permit(:name, :desc, :image_url)
	end
end
