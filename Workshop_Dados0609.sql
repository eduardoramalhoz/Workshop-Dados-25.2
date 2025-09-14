CREATE TABLE alunos (
    id_aluno SERIAL PRIMARY KEY, 
    nome VARCHAR(50) NOT NULL,
    data_nasc DATE NOT NULL,
    email VARCHAR(40) NOT NULL UNIQUE
);

CREATE TABLE matriculas (
    id_matricula SERIAL PRIMARY KEY,
    id_aluno INTEGER NOT NULL,
    nome_curso VARCHAR(50) NOT NULL,
    data_matricula DATE NOT NULL DEFAULT CURRENT_DATE,

    CONSTRAINT fk_aluno
        FOREIGN KEY (id_aluno)        
        REFERENCES alunos(id_aluno)
        ON DELETE CASCADE
);


INSERT INTO alunos (nome, data_nasc, email) VALUES
('Ana Clara Souza', '2005-03-15', 'ana.souza@email.com'),
('Bruno Carvalho', '2004-07-22', 'bruno.c@email.com'),
('Carlos Eduardo Lima', '2005-01-30', 'cadu.lima@email.com'),
('Daniela Ferreira', '2003-11-10', 'daniela.f@email.com'),
('Eduardo Martins', '2006-02-28', 'edu.martins@email.com'),
('Fernanda Gonçalves', '2005-09-05', 'fernanda.g@email.com'),
('Gustavo Rodrigues', '2004-12-12', 'gustavo.r@email.com'),
('Helena Almeida', '2003-08-19', 'helena.almeida@email.com'),
('Igor Santos', '2006-06-01', 'igor.santos@email.com'),
('Juliana Oliveira', '2005-04-25', 'juliana.o@email.com');

INSERT INTO matriculas (id_aluno, nome_curso, data_matricula) VALUES
(1, 'Introdução à Programação', '2024-02-10'),
(2, 'Banco de Dados SQL', '2024-02-11'),
(3, 'Desenvolvimento Web Front-End', '2024-03-01'),
(4, 'Análise de Dados com Python', '2024-03-05'),
(5, 'Introdução à Programação', '2024-04-15'),
(1, 'Banco de Dados SQL', '2024-05-20'), -- Ana Clara se matriculou em um segundo curso
(6, 'Design Gráfico Digital', '2024-06-18'),
(7, 'Desenvolvimento Web Front-End', '2024-07-22'),
(8, 'Análise de Dados com Python', '2024-08-01'),
(10, 'Introdução à Lógica', '2024-09-11');


UPDATE alunos
SET email = 'igor.santos.novo@email.com'
WHERE id_aluno = 9;

SELECT nome, email, data_nasc
FROM alunos
WHERE EXTRACT(YEAR FROM data_nasc) >= 2005;

SELECT
    a.nome,
    COUNT(m.id_matricula) AS total_de_cursos,
    MIN(m.data_matricula) AS primeira_matricula,
    MAX(m.data_matricula) AS ultima_matricula
FROM
    alunos AS a
JOIN
    matriculas AS m ON a.id_aluno = m.id_aluno
GROUP BY
    a.nome
HAVING
    COUNT(m.id_matricula) > 1
ORDER BY
    a.nome;