SELECT 
COUNT(RH.song_id) AS quantidade_musicas_no_historico

FROM SpotifyClone.reproduction_hist AS RH 

INNER JOIN SpotifyClone.user AS US ON RH.user_id = US.user_id

WHERE US.name_user = 'Barbara Liskov';