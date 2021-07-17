class BadgeTestService
  RULES = {
    on_first_try: Badges::OnFirstTryRuleSpecification,
    all_categories: Badges::AllCategoriesRuleSpecification
  }.freeze

  def initialize(test_passage)
    @test_passage = test_passage
  end

  def call
    Badge.find_each do |badge|
      rule = RULES[badge.rule_type].new(value: badge.rule_value, test_passage: @test_passage)
      add_badges(badge) if rule.satisfies?
    end
  end

  private

  def add_badges(badge)
    @test_passage.user.badges << badge
  end
end
