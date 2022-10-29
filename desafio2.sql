  SELECT 
  (SELECT COUNT(*) FROM SpotifyClone.song_table) AS 'cancoes',
  (SELECT COUNT(*) FROM SpotifyClone.artist) AS 'artistas',
  (SELECT COUNT(*) FROM SpotifyClone.album) AS 'albuns';