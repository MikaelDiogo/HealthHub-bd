SELECT
    CA.cod_atendimento,
    P.nome AS nome_paciente,
    CA.data_atendimento,
    CA.diagnostico,
    E.tipo AS tipo_exame
FROM
    consulta_atendimento CA
JOIN
    paciente PA ON CA.fk_paciente_ficha = PA.paciente_ficha
JOIN
    pessoa P ON PA.cpf_pessoa = P.cpf
JOIN
    exame E ON CA.cod_atendimento = E.fk_cod_atendimento
ORDER BY
    CA.data_atendimento;