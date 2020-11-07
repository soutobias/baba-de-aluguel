class BabysittersController < ApplicationController
  before_action :set_babysitter, only: [:show, :edit, :update, :destroy]

  def index

    @babysitters = policy_scope(Babysitter)

    if params[:commit].present?
      query = ""
      if params[:price] != ""
        query += "price <= #{params[:price].to_i} AND "
      end
      if params[:experience] != ""
        query += "experience >= #{params[:experience].to_i} AND "
      end
      if params[:skill] != "Selecione uma habilidade"
        query += "skill = '#{params[:skill]}' AND "
      end
      if query != ""
        query = query[0..-5]
        @babysitters = policy_scope(Babysitter).where(query).order(created_at: :desc)
      else
        @babysitters = policy_scope(Babysitter).order(created_at: :desc)
      end
    else
      @babysitters = policy_scope(Babysitter).order(created_at: :desc)
    end
    @markers = @babysitters.map do |babysitter|
      if babysitter.user.latitude && babysitter.user.longitude
        {
          lng: babysitter.user.longitude,
          lat: babysitter.user.latitude
        }
      end
    end
    @markers.compact!
  end

  def new
    if current_user.babysitter
      @babysitter = current_user.babysitter
      @service = Service.new
      authorize @babysitter
      render :show
    else
      @babysitter = Babysitter.new
      authorize @babysitter
    end
  end

  def create
    @babysitter = Babysitter.new(babysitter_params)
    authorize @babysitter
    @babysitter.user = current_user
    if @babysitter.save
      redirect_to babysitter_path(@babysitter)
    else
      render :new
    end
  end

  def show
    @service = Service.new
    @review = Review.new
    if @babysitter.users.where("user_id = ?", current_user.id).empty?
      @user = false
    else
      @user = true
    end
    if @babysitter.reviews.where("user_id = ?", current_user.id).empty?
      @user1 = true
    else
      @user1 = false
    end
  end

  def edit
  end

  def update
    @babysitter.update(babysitter_params)
    redirect_to babysitter_path(@babysitter)
  end

  def destroy
    @babysitter.destroy
    redirect_to root_path
  end

  private

  def set_babysitter
    @babysitter = Babysitter.find(params[:id])
    authorize @babysitter
  end

  def babysitter_params
    params.require(:babysitter).permit(:experience, :skill, :price)
  end

  def article_params
    params.require(:babysitter).permit(:title, :body, :photo)
  end

end
