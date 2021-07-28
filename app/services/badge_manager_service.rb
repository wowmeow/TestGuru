class BadgeManagerService
  RULES = {
    'Пройдены все тесты категории': Badges::AllTestsOfCategory,
    'Пройдены все тесты уровня': Badges::AllTestsOfLevel,
    'Тест пройден с первой попытки': Badges::TestWithFirstAttempt
  }.freeze

  def self.call(params:)
    new(params).call
  end

  def initialize(test_passage)
    @test_passage = test_passage
  end

  def call
      Badge.find_each do |badge|
        @test_passage.user.badges.push(badge) if RULES[badge.rule.to_sym].achieved?(@test_passage, badge)
    end
  end

  private

  def add_badges(badge)
    @test_passage.user.badges << badge
  end
end
