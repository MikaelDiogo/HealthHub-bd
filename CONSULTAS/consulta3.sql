SELECT
    P.nome AS nome_medico,
    M.crm,
    COUNT(CA.cod_atendimento) AS quantidade_atendimentos
FROM
    medico M
JOIN
    pessoa P ON M.cpf_pessoa = P.cpf
JOIN
    consulta_atendimento CA ON M.crm = CA.fk_medico_crm
GROUP BY
    P.nome, M.crm
HAVING
    COUNT(CA.cod_atendimento) > 2;