class PropertiesController < ApplicationController
  before_action :set_property, only: [:show, :edit, :update, :destroy]
  layout "app_no_container"

  # GET /properties
  # GET /properties.json
  def index
    if current_user
      @properties = current_user.properties
    else
      redirect_to new_user_session_path
    end
  end

  # GET /properties/1
  # GET /properties/1.json
  def show
    @pictures =  Picture.where(property_id: @property.id)
  end

  # GET /properties/new
  def new
    if current_user
      @property = Property.new
      @pictures = Picture.where(user_id: current_user.id, property_id: nil)
    else
      redirect_to new_user_session_path
    end
  end

  # GET /properties/1/edit
  def edit
    @pictures = Picture.where(user_id: current_user.id)
  end

  # POST /properties
  def create
    @property = Property.new(property_params)

    respond_to do |format|
      if @property.save
        pics = @property.pic_array.split(",")
        pics.each do |pic_id|
          pic = Picture.find(pic_id)
          if pic.property_id.nil? || pic.property_id.empty?
            pic.property_id = @property.id
            pic.save
          end
        end
        format.html { redirect_to @property, notice: 'Property was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  # PATCH/PUT /properties/1
  def update
    pics = @property.pic_array.split(",")
    pics.each do |pic_id|
      pic = Picture.find(pic_id)
      if pic.property_id.nil? || pic.property_id == 0
        pic.property_id = @property.id
        pic.save
      end
    end
    respond_to do |format|
      if @property.update(property_params)
        format.html { redirect_to @property, notice: 'Property was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  # DELETE /properties/1
  def destroy
    pictures = @property.pictures
    pictures.each do |pic|
      pic.property_id = nil
      pic.save
    end
    @property.destroy
    respond_to do |format|
      format.html { redirect_to properties_url, notice: 'Property was successfully destroyed.' }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_property
      @property = Property.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def property_params
      params.require(:property).permit(:user_id, :bed, :bath, :zip, :neighborhood, :price, :sqft, :pic_array)
    end

end
