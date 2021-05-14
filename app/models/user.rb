class User < ApplicationRecord
  def all_tests_with(level)
    Test.joins('JOIN results ON tests.id == results.test_id')
        .where(results: { user_id: id })
        .where(tests: { level: level })
  end
end
