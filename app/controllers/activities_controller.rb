class ActivitiesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_trnsaction, only: %i[show edit update destroy]
  before_action :set_categories_array, only: %i[edit update new create]

  # GET /activities or /activities.json
  def index
    @activities = Activity.order(created_at: asc)
  end

  # GET /activities/1 or /activities/1.json
  def show
  end

  # GET /activities/new
  def new
    @categories = Category.where(author_id: current_user.id)
    @activity = Activity.new
  end

  # GET /activities/1/edit
  def edit
  end

  # POST /activities or /activities.json
  def create
    name = params['activity']['name']
    amount = params['activity']['amount']
    category_ids = params['activity']['categories']
    
    @activity = Activity.new(name: name, amount: amount)
    @activity.user_id = current_user.id

    respond_to do |format|
      if @activity.save
        create_activity_category(category_ids, @activity)
        format.html do
          redirect_to category_url(category_ids[0]), notice: "Activity#{category_ids.length > 1 ? 's were' : was } successfully created." 
        end
        format.json { render :show, status: :created, location: @activity }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @activity.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /activities/1 or /activities/1.json
  def update
    respond_to do |format|
      if @activity.update(activity_params)
        format.html { redirect_to activity_url(@activity), notice: "Activity was successfully updated." }
        format.json { render :show, status: :ok, location: @activity }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @activity.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /activities/1 or /activities/1.json
  def destroy
    @activity.destroy

    respond_to do |format|
      format.html { redirect_to activities_url, notice: "Activity was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_activity
      @activity = Activity.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def activity_params
      params.require(:activity).permit(:name, :amount, :categories)
    end

    def set_categories_array
      @category_array = Category.where(author_id: current_user.id)
    end
  
    def create_activity_category(category_ids, transaction)
      category_ids.each do |category_id|
        ActivityCategory.create(category_id: category_id, activity_id: activity.id)
      end
    end
end
