class ColorOption < ApplicationRecord
  validates :font_color, presence: true
  validates :background_color, presence: true
end
