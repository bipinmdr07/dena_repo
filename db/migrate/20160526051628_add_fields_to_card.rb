class AddFieldsToCard < ActiveRecord::Migration
  def change
    add_column :cards, :prev_ef, :float, default: 2.5
    add_column :cards, :prev_interval, :float, default: 0
    add_column :cards, :quality_response, :float, default: nil
    add_column :cards, :calculated_interval, :float, default: nil
    add_column :cards, :calculated_ef, :float, default: nil
    add_column :cards, :repetition_date, :datetime, default: nil
  end
end
