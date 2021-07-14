class Admin::BadgesController < Admin::BaseController
  before_action :set_receiving_condition, only: %i[new create edit update]
  before_action :find_badge, only: %i[edit update destroy]

  def index
    @badges = Badge.all
  end

  def new
    @badge = Badge.new
  end

  def create
    @badge = Badge.new(badges_params)

    if @badge.save
      redirect_to @badge
    else
      render :new
    end
  end

  def edit; end

  def update
    @question = find_question

    if @question.update(question_params)
      redirect_to @question
    else
      render :edit
    end
  end

  def destroy
    @badge.destroy
    redirect_to admin_badge_path
  end

  private

  def badges_params
    params.require(:badge).permit(:name, :image_name, :receiving_condition)
  end

  def find_badge
    @badge = Badge.find(params[:id])
  end

  def set_receiving_condition
    @receiving_condition = Badge::RECEIVING_CONDITION
  end
end
