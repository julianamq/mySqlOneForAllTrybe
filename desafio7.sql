SELECT 
A.name_artist AS artista,
AL.name_album AS album,
COUNT(F.user_id) AS seguidores
FROM SpotifyClone.artist AS A
INNER JOIN SpotifyClone.album AS AL ON A.artist_id = AL.artist_id
INNER JOIN SpotifyClone.following_artist AS F ON A.artist_id = F.artist_id

GROUP BY artista, album
ORDER BY seguidores DESC, artista, album;