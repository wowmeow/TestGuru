module Badges
  class AllCategoriesRuleSpecification < AbstractRuleSpecification
    def satisfied?
      return false unless @test_passage.win

      test_ids = Test.ids_by_category(@rule_value).pluck(:id)
      test_passages = TestPassage.where(user_id: @user.id, test_id: test_ids, win: true).group(:test_id).count

    end
  end
end
