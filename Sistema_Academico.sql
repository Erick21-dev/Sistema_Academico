-- Cria o banco de dados
CREATE DATABASE IF NOT EXISTS faculdade_db;

-- Seleciona o banco
USE faculdade_db;

-- ==========================================
-- TABELA ALUNO
-- ==========================================
CREATE TABLE aluno (
    rgm VARCHAR(20) NOT NULL,
    nome VARCHAR(100) NOT NULL,
    data_nascimento DATE,
    cpf VARCHAR(14),
    email VARCHAR(100),
    endereco VARCHAR(200),
    municipio VARCHAR(100),
    uf VARCHAR(2),
    celular VARCHAR(20),
    curso VARCHAR(100),
    campus VARCHAR(100),
    periodo VARCHAR(50),
    PRIMARY KEY (rgm)
);

-- ==========================================
-- TABELA NOTAS E FALTAS
-- ==========================================
CREATE TABLE notas_faltas (
    id INT NOT NULL AUTO_INCREMENT,
    rgm_aluno VARCHAR(20) NOT NULL,
    disciplina VARCHAR(100) NOT NULL,
    semestre VARCHAR(20) NOT NULL,
    nota DOUBLE NOT NULL,
    faltas INT NOT NULL,
    PRIMARY KEY (id),
    CONSTRAINT fk_notas_aluno
        FOREIGN KEY (rgm_aluno)
        REFERENCES aluno (rgm)
        ON DELETE CASCADE
        ON UPDATE CASCADE
);

-- ==========================================
-- DADOS INICIAIS (OPCIONAL)
-- ==========================================
INSERT INTO aluno (
    rgm,
    nome,
    data_nascimento,
    cpf,
    email,
    endereco,
    municipio,
    uf,
    celular,
    curso,
    campus,
    periodo
) VALUES (
    '123456',
    'Erick Silva',
    '2007-03-24',
    '123.456.789-00',
    'erick@email.com',
    'Rua Exemplo, 123',
    'São Paulo',
    'SP',
    '(11)99999-9999',
    'Engenharia de Software',
    'Tatuapé',
    'Noturno'
);

INSERT INTO notas_faltas (
    rgm_aluno,
    disciplina,
    semestre,
    nota,
    faltas
) VALUES
('123456', 'Programação Orientada a Objetos', '2026-1', 8.5, 2),
('123456', 'Estrutura de Dados', '2026-1', 9.0, 1),
('123456', 'Banco de Dados', '2026-1', 10.0, 0);

-- ==========================================
-- CONSULTAS DE TESTE
-- ==========================================
-- SELECT * FROM aluno;
-- SELECT * FROM notas_faltas;