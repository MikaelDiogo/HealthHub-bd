SELECT
    M.crm,
    P.nome AS nome_medico,
    COUNT(CA.cod_atendimento) AS total_atendimentos
FROM
    medico M
JOIN
    pessoa P ON M.cpf_pessoa = P.cpf
LEFT JOIN
    consulta_atendimento CA ON M.crm = CA.fk_medico_crm
GROUP BY
    M.crm, P.nome
ORDER BY
    total_atendimentos DESC;
Resultado:
