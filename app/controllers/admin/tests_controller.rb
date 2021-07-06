class Admin::TestsController < Admin::BaseController
  before_action :authenticate_user!
  before_action :set_tests, only: %i[index update_inline]
  before_action :set_test, only: %i[show edit update update_inline destroy start]

  def index; end

  def show; end

  def new
    @test = Test.new
  end

  def edit; end

  def create
    @test = Test.new(test_params)
    @test.author_id = current_user

    if @test.save
      redirect_to @test
    else
      render :new
    end
  end

  def update
    if @test.update(test_params)
      redirect_to @test
    else
      render :edit
    end
  end

  def update_inline
    if @test.update(test_params)
      redirect_to admin_test_path
    else
      render :index
    end
  end

  def destroy
    @test.destroy
    redirect_to tests_path
  end

  def start
    current_user.tests.push(@test)
    redirect_to current_user.test_passage(@test)
  end

  private

  def set_tests
    @test = Test.all
  end

  def test_params
    params.require(:test).permit(:title, :category_id)
  end

  def set_test
    @test = Test.find(params[:id])
  end
end
