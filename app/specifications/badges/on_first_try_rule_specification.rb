module Badges
  class OnFirstTryRuleSpecification < AbstractRuleSpecification
    def satisfied?
      return false unless @test_passage.win
      return false if TestPassage.where(test_id: @test_passage.test_id, user_id: @user.id).count > 1

      # return false if TestPassage.where(test_id: @test_passage.test_id, user_id: @user.id).count > @rule_value

      true
    end
  end
end
