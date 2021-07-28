module Badges
  class AllTestsOfLevel < AbstractRuleSpecification
    def satisfied?
      return false unless @test_passage.win

      test_ids = Test.find_by_level(@rule_value)
      test_passages = TestPassage.where(user_id: @user.id, test_id: test_ids, win: true).group(:test_id).count

    end
  end
end
