SELECT
    PA.paciente_ficha,
    P.nome AS nome_paciente,
    P.cidade,
    P.bairro
FROM
    paciente PA
JOIN
    pessoa P ON PA.cpf_pessoa = P.cpf
WHERE
    P.bairro IS NULL OR P.bairro = '';