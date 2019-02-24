class KittensController < ApplicationController

  def index
  	@kittens = Kitten.all
  end

  def new
  	@kitten = Kitten.new
  end


  	
  def show
  	@kitten = Kitten.find(params[:id])
  end

  def edit
  	@kitten = Kitten.find(params[:id])
  end

  def create
  	@kitten = Kitten.new(kitten_params)
  	if @kitten.save
  		flash[:info] = "Kitten Created"
  		redirect_to root_url
  	else
  		render 'new'
  	end		
  end

  def update
  	@kitten = Kitten.find(params[:id])
  	if @kitten.update_attributes(kitten_params)
  		flash[:success] =  "Kitten Updated"
  		redirect_to @kitten
  	else
  		render 'edit'
  	end		
  	
  end

  def destroy
  	
  end


  private

  def kitten_params
  	params.require(:kitten).permit(:name, :age, :cuteness, :softness)
  end

end
