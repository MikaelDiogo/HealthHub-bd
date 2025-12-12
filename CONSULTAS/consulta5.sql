SELECT
    PR.cod_prescricao,
    PR.medicamento,
    P.nome AS nome_paciente
FROM
    prescricao PR
JOIN
    consulta_atendimento CA ON PR.fk_cod_atendimento = CA.cod_atendimento
JOIN
    paciente PA ON CA.fk_paciente_ficha = PA.paciente_ficha
JOIN
    pessoa P ON PA.cpf_pessoa = P.cpf
WHERE
    PR.fk_cod_atendimento IN (1, 6);