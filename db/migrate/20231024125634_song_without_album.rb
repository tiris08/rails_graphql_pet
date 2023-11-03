class SongWithoutAlbum < ActiveRecord::Migration[7.0]
  def change
    change_column_null :songs, :album_id, true
  end
end
