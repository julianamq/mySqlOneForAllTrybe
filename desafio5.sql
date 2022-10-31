SELECT 
song.name_song as cancao,
COUNT(hp.song_id) AS reproducoes
FROM SpotifyClone.song_table AS song
INNER JOIN `SpotifyClone`.reproduction_hist AS hp ON  hp.song_id = song.song_id

GROUP BY cancao
ORDER BY reproducoes DESC, cancao
LIMIT 2;
