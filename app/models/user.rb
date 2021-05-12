class User < ApplicationRecord
  def current_tests_by(level)
    tests.where(level: level)
  end
end
