SELECT 
A.name_artist AS artista,
AL.name_album AS album
 FROM SpotifyClone.artist AS A
 INNER JOIN SpotifyClone.album AS AL ON A.artist_id = AL.artist_id
 WHERE A.name_artist = 'Elis Regina'
 ORDER BY album;


