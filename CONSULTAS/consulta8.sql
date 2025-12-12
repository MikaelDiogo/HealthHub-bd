SELECT DISTINCT
    P.nome AS nome_paciente,
    PA.paciente_ficha
FROM
    paciente PA
JOIN
    pessoa P ON PA.cpf_pessoa = P.cpf
JOIN
    consulta_atendimento CA ON PA.paciente_ficha = CA.fk_paciente_ficha
JOIN
    evolucao_clinica EC ON CA.cod_atendimento = EC.fk_cod_atendimento
ORDER BY
    P.nome;