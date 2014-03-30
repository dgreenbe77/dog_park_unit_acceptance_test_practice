class DogsController < ApplicationController

  def new
    @dog = Dog.new

  end

  def show
    @dogs = Dog.all
  end

  def create
    @dog = Dog.new(dog_params)

    if @dog.save
      redirect_to @dog, notice: 'You let the dogz out'
    else
      render new_dog_path
    end

    #     respond_to do |format|
    #   if @dog.save
    #     format.html { redirect_to action: 'new', notice: 'Cform was successfully created.' }
    #     format.json { render action: 'new', status: :created, location: @cform }
    #   else
    #     format.html { render action: 'new' }
    #     format.json { render json: @dog.errors, status: :unprocessable_entity }
    #   end
    # end
  end

  private

    def dog_params
      params.require(:dog).permit(:email, :dog_name, :first_name, :last_name)
    end

end
