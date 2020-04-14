class ColorOptionsController < ApplicationController
  def index
    load_collection
  end

  def new
    load_new_model
  end

  def create
    @model = ColorOption.new(resource_params)

    @model.save ? successful_create : unsuccessful_create
  end

  def edit
    load_model
  end

  def update
    load_model

    @model.assign_attributes(resource_params)

    @model.save ? successful_update : unsuccessful_update
  end

  def destroy
    load_model

    @model.destroy ? successful_destroy : unsuccessful_destroy
  end

  private

  def load_model
    @model = ColorOption.find(params[:id])
  end

  def load_collection
    @collection = ColorOption.order(:created_at)
  end

  def load_new_model
    @model = ColorOption.new(
      font_color: default_font_color,
      background_color: default_background_color,
    )
  end

  def resource_params
    params.require(:color_option).permit(:font_color, :background_color)
  end

  def successful_create
    flash[:success] = "Successfully created a Color Option"

    redirect_to color_options_path
  end

  def unsuccessful_create
    flash.now[:error] = "Unable to create the Color Option"

    render :new
  end

  def successful_update
    flash[:success] = "Successfully updated the Color Option"

    redirect_to color_options_path
  end

  def unsuccessful_update
    flash.now[:error] = "Unable to update the Color Option"

    render :edit
  end

  def successful_destroy
    flash[:success] = "Successfully removed the Color Option"

    redirect_to color_options_path
  end

  def unsuccessful_destroy
    flash.now[:error] = "Unable to remove the Color Option"

    render :index
  end

  def default_font_color
    :white
  end

  def default_background_color
    :black
  end
end

