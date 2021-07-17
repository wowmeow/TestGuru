module Badges
  class TestWithFirstAttempt < AbstractRuleSpecification
    def satisfied?
      return false unless @test_passage.win
      return false if TestPassage.where(test_id: @test_passage.test_id, user_id: @user.id).count > 1

      true
    end
  end
end