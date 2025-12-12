SELECT
    P.nome AS nome_paciente,
    PA.paciente_ficha
FROM
    pessoa P
JOIN
    paciente PA ON P.cpf = PA.cpf_pessoa
WHERE
    EXISTS (
        SELECT 1
        FROM consulta_atendimento CA
        JOIN exame E ON CA.cod_atendimento = E.fk_cod_atendimento
        WHERE CA.fk_paciente_ficha = PA.paciente_ficha
    );