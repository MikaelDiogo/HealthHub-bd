SELECT
    P.nome AS nome_paciente,
    P.cidade,
    COUNT(PR.cod_prescricao) AS total_prescricoes
FROM
    pessoa P
JOIN
    paciente PA ON P.cpf = PA.cpf_pessoa
LEFT JOIN
    consulta_atendimento CA ON PA.paciente_ficha = CA.fk_paciente_ficha
LEFT JOIN
    prescricao PR ON CA.cod_atendimento = PR.fk_cod_atendimento
WHERE
    P.cidade IN ('Fortaleza', 'Crateús')
GROUP BY
    P.nome, P.cidade
ORDER BY
    total_prescricoes DESC, P.nome;