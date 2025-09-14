CREATE TABLE Clientes (
    id_cliente SERIAL PRIMARY KEY,
    nome_completo VARCHAR(150) NOT NULL,
    cpf VARCHAR(11) NOT NULL UNIQUE,
    endereco VARCHAR(255) NOT NULL,
    telefone VARCHAR(20) NOT NULL,
    email VARCHAR(100) UNIQUE,
    data_cadastro DATE NOT NULL
);

CREATE TABLE Funcionarios (
    id_funcionario SERIAL PRIMARY KEY,
    nome_completo VARCHAR(150) NOT NULL,
    cpf VARCHAR(11) NOT NULL UNIQUE,
    cargo VARCHAR(50) NOT NULL,
    telefone VARCHAR(20),
    email VARCHAR(100) NOT NULL UNIQUE,
    data_admissao DATE NOT NULL
);

CREATE TABLE Veiculos (
    id_veiculo SERIAL PRIMARY KEY,
    placa VARCHAR(7) NOT NULL UNIQUE,
    modelo VARCHAR(100) NOT NULL,
    cor VARCHAR(30) NOT NULL,
    ano_fabricacao INT NOT NULL,
    valor_dia DECIMAL(10, 2) NOT NULL,
    status VARCHAR(20) NOT NULL DEFAULT 'Disponível'
);

CREATE TABLE Alugueis (
    id_aluguel SERIAL PRIMARY KEY,
    data_inicio TIMESTAMP NOT NULL,
    data_fim_prevista TIMESTAMP NOT NULL,
    data_fim_real TIMESTAMP NULL,
    valor_total DECIMAL(10, 2) NOT NULL,
    status VARCHAR(20) NOT NULL DEFAULT 'Ativo',
    id_cliente INT NOT NULL,
    id_funcionario INT NOT NULL,
    id_veiculo INT NOT NULL,
    FOREIGN KEY (id_cliente) REFERENCES Clientes(id_cliente),
    FOREIGN KEY (id_funcionario) REFERENCES Funcionarios(id_funcionario),
    FOREIGN KEY (id_veiculo) REFERENCES Veiculos(id_veiculo)
);

CREATE TABLE Pagamentos (
    id_pagamento SERIAL PRIMARY KEY,
    valor_pago DECIMAL(10, 2) NOT NULL,
    data_pagamento TIMESTAMP NOT NULL,
    metodo_pagamento VARCHAR(20) NOT NULL,
    status VARCHAR(20) NOT NULL DEFAULT 'Pendente',
    id_aluguel INT NOT NULL,
    FOREIGN KEY (id_aluguel) REFERENCES Alugueis(id_aluguel)
);


CREATE TABLE Manutencoes (
    id_manutencao SERIAL PRIMARY KEY,
    descricao TEXT NOT NULL,
    custo DECIMAL(10, 2) NOT NULL,
    data_manutencao DATE NOT NULL,
    responsavel VARCHAR(150) NOT NULL,
    data_proxima_Manutencao DATE NULL,
    id_veiculo INT NOT NULL,
    FOREIGN KEY (id_veiculo) REFERENCES Veiculos(id_veiculo)
);

INSERT INTO Clientes (nome_completo, cpf, endereco, telefone, email, data_cadastro) VALUES
('João Silva', '11122233344', 'Rua das Flores, 123, São Paulo, SP', '(11) 98765-4321', 'joao.silva@email.com', '2023-01-15'),
('Maria Oliveira', '22233344455', 'Avenida Brasil, 456, Rio de Janeiro, RJ', '(21) 91234-5678', 'maria.o@email.com', '2023-02-20'),
('Carlos Pereira', '33344455566', 'Praça da Sé, 789, Salvador, BA', '(71) 95678-1234', 'carlos.pereira@email.com', '2023-03-10'),
('Ana Costa', '44455566677', 'Rua dos Pinheiros, 101, Curitiba, PR', '(41) 98888-7777', 'ana.costa@email.com', '2023-04-05'),
('Pedro Martins', '55566677788', 'Avenida Paulista, 202, São Paulo, SP', '(11) 97777-8888', 'pedro.m@email.com', '2023-05-12'),
('Juliana Santos', '66677788899', 'Rua da Praia, 303, Porto Alegre, RS', '(51) 96666-5555', 'juliana.s@email.com', '2023-06-18'),
('Lucas Souza', '77788899900', 'Avenida Boa Viagem, 404, Recife, PE', '(81) 95555-6666', 'lucas.souza@email.com', '2023-07-22'),
('Fernanda Lima', '88899900011', 'Setor Hoteleiro Sul, 505, Brasília, DF', '(61) 94444-3333', 'fernanda.lima@email.com', '2023-08-30'),
('Rafael Almeida', '99900011122', 'Rua Augusta, 606, São Paulo, SP', '(11) 93333-4444', 'rafael.a@email.com', '2024-09-01'),
('Gabriela Ferreira', '00011122233', 'Avenida Beira Mar, 707, Fortaleza, CE', '(85) 92222-1111', 'gabriela.f@email.com', '2024-10-05');

INSERT INTO Funcionarios (nome_completo, cpf, cargo, telefone, email, data_admissao) VALUES
('Ricardo Mendes', '12312312311', 'Gerente', '(11) 91111-1111', 'ricardo.mendes@velozcar.com', '2020-01-10'),
('Beatriz Costa', '23423423422', 'Vendedora', '(11) 92222-2222', 'beatriz.costa@velozcar.com', '2021-03-15'),
('Sérgio Lima', '34534534533', 'Vendedor', '(11) 93333-3333', 'sergio.lima@velozcar.com', '2021-03-15'),
('Tatiana Alves', '45645645644', 'Atendente de Balcão', '(11) 94444-4444', 'tatiana.alves@velozcar.com', '2022-06-20'),
('Marcos Rocha', '56756756755', 'Atendente de Balcão', '(11) 95555-5555', 'marcos.rocha@velozcar.com', '2022-07-25'),
('Flávia Andrade', '67867867866', 'Manutenção', '(11) 96666-6666', 'flavia.andrade@velozcar.com', '2022-09-01'),
('Renato Paiva', '78978978977', 'Coordenador de Frota', '(11) 97777-7777', 'renato.paiva@velozcar.com', '2021-11-05'),
('Camila Ribeiro', '89089089088', 'Financeiro', '(11) 98888-8888', 'camila.ribeiro@velozcar.com', '2023-02-10');

INSERT INTO Veiculos (placa, modelo, cor, ano_fabricacao, valor_dia, status) VALUES
('ABC1D23', 'Chevrolet Onix', 'Branco', 2022, 120.00, 'Disponível'),
('DEF4E56', 'Hyundai HB20', 'Prata', 2023, 130.00, 'Disponível'),
('GHI7F89', 'Renault Kwid', 'Vermelho', 2022, 95.00, 'Alugado'),
('JKL0G12', 'Jeep Compass', 'Preto', 2023, 250.00, 'Disponível'),
('MNO3H45', 'Fiat Toro', 'Cinza', 2023, 280.00, 'Em Manutenção'),
('PQR6I78', 'Volkswagen Gol', 'Branco', 2021, 110.00, 'Disponível'),
('STU9J01', 'Fiat Mobi', 'Prata', 2023, 100.00, 'Disponível'),
('VWX2K34', 'Jeep Renegade', 'Azul', 2022, 230.00, 'Alugado'),
('YZA5L67', 'Toyota Corolla', 'Preto', 2023, 300.00, 'Disponível'),
('BCD8M90', 'Honda HR-V', 'Cinza', 2022, 290.00, 'Disponível');

INSERT INTO Manutencoes (descricao, custo, data_manutencao, responsavel, data_proxima_manutencao, id_veiculo) VALUES
('Troca de óleo e filtro do motor', 350.00, '2024-08-10', 'Oficina Central', '2025-02-10', 5),
('Revisão completa dos 20.000km', 950.00, '2024-07-20', 'Flávia Andrade', '2025-01-20', 1),
('Troca de pastilhas de freio', 480.00, '2024-09-01', 'Oficina Freio Seguro', '2025-09-01', 2),
('Alinhamento e balanceamento', 180.00, '2024-09-05', 'Flávia Andrade', NULL, 4),
('Verificação do sistema de ar-condicionado', 250.00, '2024-06-15', 'Oficina Central', NULL, 6),
('Troca de pneus', 1600.00, '2024-05-10', 'Pneu Forte', '2024-11-10', 9),
('Revisão dos 10.000km', 650.00, '2024-08-25', 'Flávia Andrade', '2025-02-25', 7),
('Reparo no motor de arranque', 880.00, '2024-09-12', 'Oficina Central', NULL, 5);

INSERT INTO Alugueis (data_inicio, data_fim_prevista, data_fim_real, valor_total, status, id_cliente, id_funcionario, id_veiculo) VALUES
('2024-08-01 10:00:00', '2024-08-05 10:00:00', '2024-08-05 09:30:00', 480.00, 'Finalizado', 1, 2, 1),
('2024-08-10 14:00:00', '2024-08-15 14:00:00', '2024-08-15 13:45:00', 650.00, 'Finalizado', 2, 3, 2),
('2024-09-10 09:00:00', '2024-09-15 09:00:00', NULL, 475.00, 'Ativo', 3, 4, 3),
('2024-09-12 11:00:00', '2024-09-14 11:00:00', NULL, 500.00, 'Ativo', 4, 5, 4),
('2024-07-05 08:00:00', '2024-07-10 08:00:00', '2024-07-10 08:15:00', 550.00, 'Finalizado', 5, 2, 6),
('2024-09-08 16:00:00', '2024-09-18 16:00:00', NULL, 2300.00, 'Ativo', 6, 3, 8),
('2024-08-20 12:00:00', '2024-08-23 12:00:00', '2024-08-23 11:50:00', 900.00, 'Finalizado', 7, 4, 9),
('2024-09-01 15:00:00', '2024-09-04 15:00:00', NULL, 870.00, 'Atrasado', 8, 5, 10),
('2024-09-13 18:00:00', '2024-09-20 18:00:00', NULL, 770.00, 'Ativo', 9, 2, 6),
('2024-06-10 10:00:00', '2024-06-12 10:00:00', '2024-06-12 10:00:00', 260.00, 'Finalizado', 10, 3, 2);

INSERT INTO Pagamentos (valor_pago, data_pagamento, metodo_pagamento, status, id_aluguel) VALUES
(480.00, '2024-08-01 10:05:00', 'Cartão de Crédito', 'Concluído', 1),
(650.00, '2024-08-10 14:02:00', 'Pix', 'Concluído', 2),
(475.00, '2024-09-10 09:05:00', 'Débito', 'Concluído', 3),
(500.00, '2024-09-12 11:03:00', 'Em Espécie', 'Concluído', 4),
(550.00, '2024-07-05 08:02:00', 'Cartão de Crédito', 'Concluído', 5),
(2300.00, '2024-09-08 16:05:00', 'Pix', 'Concluído', 6),
(900.00, '2024-08-20 12:01:00', 'Débito', 'Concluído', 7),
(870.00, '2024-09-05 10:00:00', 'Pendente', 'Pendente', 8), 
(770.00, '2024-09-13 18:02:00', 'Cartão de Crédito', 'Concluído', 9),
(260.00, '2024-06-10 10:01:00', 'Em Espécie', 'Concluído', 10);


UPDATE Alugueis
SET 
    status = 'Finalizado',
    data_fim_real = '2025-09-13 11:30:00'
WHERE id_aluguel = 3;

UPDATE Veiculos
SET 
    status = 'Disponível'
WHERE id_veiculo = 3;


SELECT 
    EXTRACT(YEAR FROM data_cadastro) AS ano_cadastro,
    COUNT(id_cliente) AS total_novos_clientes
FROM Clientes
GROUP BY ano_cadastro
ORDER BY ano_cadastro;

SELECT cargo,
    COUNT(id_funcionario) AS quantidade_funcionarios
FROM Funcionarios
GROUP BY cargo
ORDER BY quantidade_funcionarios DESC;

SELECT status,
    COUNT(id_veiculo) AS quantidade_veiculos,
    AVG(valor_dia)::DECIMAL(10,2) AS media_valor_diaria
FROM Veiculos
GROUP BY status;

SELECT id_veiculo,
    SUM(custo) AS custo_total_manutencao
FROM Manutencoes
GROUP BY id_veiculo
ORDER BY custo_total_manutencao DESC;

SELECT TO_CHAR(data_inicio, 'YYYY-MM') AS mes_aluguel,
    SUM(valor_total) AS faturamento_mensal
FROM Alugueis
GROUP BY mes_aluguel
ORDER BY mes_aluguel;

SELECT metodo_pagamento,
    SUM(valor_pago) AS total_recebido
FROM Pagamentos
WHERE status = 'Concluído'
GROUP BY metodo_pagamento
ORDER BY total_recebido DESC;

SELECT
    a.id_aluguel,
    c.nome_completo AS nome_cliente,
    v.modelo AS veiculo,
    v.placa,
    a.data_inicio,
    a.data_fim_prevista,
    a.status
FROM Alugueis AS a
INNER JOIN Clientes AS c ON a.id_cliente = c.id_cliente
INNER JOIN Veiculos AS v ON a.id_veiculo = v.id_veiculo
WHERE a.status IN ('Ativo', 'Atrasado')
ORDER BY a.data_fim_prevista ASC;

SELECT
    v.placa,
    v.modelo,
    v.status,
    MAX(m.data_manutencao) AS data_ultima_manutencao
FROM Veiculos AS v
LEFT JOIN Manutencoes AS m ON v.id_veiculo = m.id_veiculo
GROUP BY v.placa, v.modelo, v.status
ORDER BY data_ultima_manutencao ASC NULLS FIRST;


