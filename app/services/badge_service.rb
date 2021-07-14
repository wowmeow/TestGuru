class BadgeService
  def initialize(test_passage)
    @test_passage = test_passage
    @user = @test_passage.user
    @test = @test_passage.test
    @badges = Badge.all
  end

  def call
    @badges.select { |badge| send(badge.receiving_condition, badge.optional) }
  end

  private

  #  Receiving condition methods (see app/models/badge.rb)

  def all_tests_in_category(category_name)
    return false unless @test.category.title = category_name

    passed_tests.where(category_id: @test.category_id).uniq.count == Test.select_by_category(@test.category.title).count
  end

  def pass_on_first_try
    passed_tests.where(id: @test.id).count == 1
  end

  def all_tests_at_level(level_number)
    passed_tests.where(level: @test.level).uniq.count == Test.select_by_level(level_number).count
  end

  def passed_tests
    @user.tests.merge(TestPassage.where(success: true))
  end
end
