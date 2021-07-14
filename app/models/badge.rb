class Badge < ApplicationRecord
  IMAGES = 'public/badges'.freeze

  RECEIVING_CONDITION = [
    { name: 'Пройдены все тесты категории',
      method: 'all_tests_in_category',
      parameter: Category.all.pluck(:title) },
    { name: 'Тест пройден с первой попытки',
      method: 'pass_on_first_try',
      parameter: [1] },
    { name: 'Пройдены все тесты одного уровня',
      method: 'all_tests_at_level',
      parameter: [0, 1, 2, 3] }
  ].freeze

  # has_many :badge_users, dependent: destroy
  has_many :users, through: :badge_users

  validates :name, presence: true, uniqueness: true
  validates :image_name, presence: true, uniqueness: true
  validates :receiving_condition, presence: true

  def images_dir
    Dir.children(IMAGES)
  end
end
