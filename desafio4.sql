
SELECT 
 user.name_user as 'usuario',
IF (MAX(YEAR(hp.date_reproduction)) >= 2021, 'Usuário ativo', 'Usuário inativo') AS status_usuario 
FROM SpotifyClone.user AS user
INNER JOIN SpotifyClone.reproduction_hist AS hp
ON user.user_id = hp.user_id
GROUP BY usuario

ORDER BY usuario;