SELECT 
  user.name_user as 'usuario',
  COUNT(hp.song_id) as 'qt_de_musicas_ouvidas',
  ROUND(SUM(song.duration_seconds)/60, 2) AS 'total_minutos'
FROM  SpotifyClone.user as user
INNER JOIN `SpotifyClone`.reproduction_hist AS hp ON user.user_id = hp.user_id
INNER JOIN `SpotifyClone`.song_table AS song ON hp.song_id = song.song_id
GROUP BY usuario
ORDER BY usuario; 
