module Loaders
  class TwoFirstReleasedSongsLoader < GraphQL::Batch::Loader
    def perform(albums)
      song_ids = Song.where(album: albums)
                     .order(released_at: :desc)
                     .group_by(&:album_id)
                     .transform_values { |songs| songs.last(2) }

      albums.each { |album| fulfill(album, song_ids[album.id] || []) }
    end
  end
end
