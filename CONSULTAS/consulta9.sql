SELECT DISTINCT
    M.crm,
    PM.nome AS nome_medico
FROM
    medico M
JOIN
    pessoa PM ON M.cpf_pessoa = PM.cpf
WHERE
    M.crm = ANY (
        SELECT
            fk_medico_crm
        FROM
            consulta_atendimento CA
        JOIN
            paciente PA ON CA.fk_paciente_ficha = PA.paciente_ficha
        JOIN
            pessoa PP ON PA.cpf_pessoa = PP.cpf
        WHERE
            DATE_PART('year', CURRENT_DATE) - DATE_PART('year', PP.data_nascimento) > 70
    );