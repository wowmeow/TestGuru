class Admin::BadgesController < Admin::BaseController
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
    params.require(:badges).permit(:name, :image_name, :receiving_condition)
  end

  def find_badge
    @badge = Badge.find(params[:id])
  end

end