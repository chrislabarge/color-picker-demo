class CreateColorOptions < ActiveRecord::Migration[6.0]
  def change
    create_table :color_options do |t|
      t.string :font_color
      t.string :background_color

      t.timestamps
    end
  end
end
