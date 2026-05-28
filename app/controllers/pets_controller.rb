class PetsController < ApplicationController
	before_action :authenticate_user!
	before_action :set_pet, only: [:show, :edit, :update, :destroy]
	
  	after_action :verify_authorized, except: :index
  	after_action :verify_policy_scoped, only: :index

	def index
		@pets = policy_scope(Pet)
	end

	def show
		authorize @pet
		@owner = @pet.owner
		@appointments = @pet.appointments
	end

	def new
		@pet = Pet.new
		authorize @pet
	end

	def edit
		authorize @pe
	end

	def create
		@pet = Pet.new(pet_params)
		authorize @pet
		if current_user.owner? && @pet.owner_id.nil?
      		@pet.owner_id = current_user.owner.id
    	end
		if @pet.save
			flash[:notice] = "The pet has been created correctly"
			redirect_to pet_path(@pet)
		else
			render :new, status: :unprocessable_entity
		end
	end

	def update
		authorize @pet
		if @pet.update(pet_params)
			flash[:notice] = "The pet has been updated correctly"
			redirect_to pet_path(@pet)
		else
			render :edit, status: :unprocessable_entity
		end
	end

	def destroy
		authorize @pet
		@pet.destroy
		flash[:notice] = "The pet has been deleted correctly"
		redirect_to pets_path
	end

	private
	def set_pet
		@pet = Pet.find(params[:id])
	end

	def pet_params
		params.require(:pet).permit(policy(@pet || Pet).permitted_attributes)	
	end
end
