WITH IdadesFuncionario AS (
    SELECT
        P.cpf,
        DATE_PART('year', CURRENT_DATE) - DATE_PART('year', P.data_nascimento) AS idade_anos
    FROM
        pessoa P
    WHERE
        P.cpf IN (SELECT cpf_pessoa FROM medico UNION ALL SELECT cpf_pessoa FROM recepcionista)
)
SELECT
    P.nome AS nome_recepcionista,
    IFU.idade_anos AS idade_atual
FROM
    pessoa P
JOIN
    recepcionista R ON P.cpf = R.cpf_pessoa
JOIN
    IdadesFuncionario IFU ON P.cpf = IFU.cpf
WHERE
    IFU.idade_anos > (
        SELECT AVG(idade_anos)
        FROM IdadesFuncionario
    )
ORDER BY
    IFU.idade_anos DESC;