class ChangePosterUrlDataTypeInMovies < ActiveRecord::Migration[7.0]
  def change
    change_column :movies, :poster_url, :text
  end
end
