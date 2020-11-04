class BabysittersController < ApplicationController
  before_action :set_babysitter, only: [:show, :edit, :update, :destroy]

  def index
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
  end

  def new
    @babysitter = Babysitter.new
    authorize @babysitter
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
  end

  def edit
  end

  def update
    @babysitter.update(babysitter_params)
    redirect_to babysitter_path(@babysitter)
  end

  def destroy
    @babysitter.destroy
    redirect_to profile_path
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
