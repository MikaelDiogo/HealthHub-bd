CREATE TABLE pessoa (
    cpf VARCHAR(14) PRIMARY KEY,
    nome VARCHAR(120) NOT NULL,
    data_nascimento DATE, 
    telefone VARCHAR(20),
    cidade VARCHAR(100),
    bairro VARCHAR(100),
    rua VARCHAR(150),
    numero_residencia VARCHAR(30)
);

CREATE TABLE medico (
    crm VARCHAR(30) PRIMARY KEY,
    cpf_pessoa VARCHAR(14) NOT NULL,
    FOREIGN KEY (cpf_pessoa) REFERENCES pessoa(cpf)
        ON UPDATE CASCADE
        ON DELETE RESTRICT
);

CREATE TABLE paciente (
    paciente_ficha SERIAL PRIMARY KEY,
    cpf_pessoa VARCHAR(14) NOT NULL,
    FOREIGN KEY (cpf_pessoa) REFERENCES pessoa(cpf)
        ON UPDATE CASCADE
        ON DELETE RESTRICT
);

CREATE TABLE recepcionista (
    id_recepcionista SERIAL PRIMARY KEY,
    cpf_pessoa VARCHAR(14) NOT NULL,
    FOREIGN KEY (cpf_pessoa) REFERENCES pessoa(cpf)
        ON UPDATE CASCADE
        ON DELETE RESTRICT
);

CREATE TABLE consulta_atendimento (
    cod_atendimento SERIAL PRIMARY KEY, 
    fk_medico_crm VARCHAR(30) NOT NULL,
    fk_paciente_ficha INT NOT NULL,
    data_atendimento DATE NOT NULL,
    horario TIME, 
    motivo_atendimento TEXT,
    diagnostico TEXT,
    
    FOREIGN KEY (fk_medico_crm) REFERENCES medico(crm)
        ON UPDATE CASCADE
        ON DELETE RESTRICT,

    FOREIGN KEY (fk_paciente_ficha) REFERENCES paciente(paciente_ficha)
        ON UPDATE CASCADE
        ON DELETE RESTRICT
);

CREATE TABLE prescricao (
    cod_prescricao SERIAL PRIMARY KEY,
    fk_cod_atendimento INT NOT NULL,
    medicamento VARCHAR(200), 
    duracao_aplicacao VARCHAR(100),

    FOREIGN KEY (fk_cod_atendimento) REFERENCES consulta_atendimento(cod_atendimento)
        ON UPDATE CASCADE
        ON DELETE CASCADE
);

CREATE TABLE exame ( 
    cod_exame SERIAL PRIMARY KEY,
    fk_cod_atendimento INT NOT NULL,
    tipo VARCHAR(100),
    data_exame DATE,

    FOREIGN KEY (fk_cod_atendimento) REFERENCES consulta_atendimento(cod_atendimento)
        ON UPDATE CASCADE
        ON DELETE CASCADE
);

CREATE TABLE evolucao_clinica (
    cod_evolucao SERIAL PRIMARY KEY,
    fk_cod_atendimento INT NOT NULL,
    relato_medico TEXT,

    FOREIGN KEY (fk_cod_atendimento) REFERENCES consulta_atendimento(cod_atendimento)
        ON UPDATE CASCADE
        ON DELETE CASCADE
);