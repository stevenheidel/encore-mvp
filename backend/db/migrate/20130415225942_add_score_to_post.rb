class AddScoreToPost < ActiveRecord::Migration
  def change
    add_column :posts, :filter_score, :integer
  end
end
