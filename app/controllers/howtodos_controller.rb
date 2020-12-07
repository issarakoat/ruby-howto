class HowtodosController < ApplicationController
  before_action :set_howtodo, only: [:show, :edit, :update, :destroy]

  # GET /howtodos
  # GET /howtodos.json
  def index
    @howtodos = Howtodo.all
    if params[:title]
      @howtodos = Howtodo.where('title ILIKE ?', "%#{params[:title]}%") #case-insensitive
    else
      @howtodos = Howtodo.all
    end
  end

  # GET /howtodos/1
  # GET /howtodos/1.json
  def show
  end

  # GET /howtodos/new
  def new
    @howtodo = Howtodo.new
  end

  # GET /howtodos/1/edit
  def edit
  end

  # POST /howtodos
  # POST /howtodos.json
  def create
    @howtodo = Howtodo.new(howtodo_params)
    @howtodo.user = current_user

    respond_to do |format|
      if @howtodo.save
        format.html { redirect_to @howtodo, notice: 'Howtodo was successfully created.' }
        format.json { render :show, status: :created, location: @howtodo }
      else
        format.html { render :new }
        format.json { render json: @howtodo.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /howtodos/1
  # PATCH/PUT /howtodos/1.json
  def update
    respond_to do |format|
      if @howtodo.update(howtodo_params)
        format.html { redirect_to @howtodo, notice: 'Howtodo was successfully updated.' }
        format.json { render :show, status: :ok, location: @howtodo }
      else
        format.html { render :edit }
        format.json { render json: @howtodo.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /howtodos/1
  # DELETE /howtodos/1.json
  def destroy
    @howtodo.destroy
    respond_to do |format|
      format.html { redirect_to howtodos_url, notice: 'Howtodo was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_howtodo
      @howtodo = Howtodo.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def howtodo_params
      params.require(:howtodo).permit(:title, :description)
    end
end
