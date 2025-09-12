Documentação Workshop de Análise de Dados - 11/09
O código utiliza a biblioteca ‘pandas’ para limpar e tratar os dados do arquivo CSV. O objetivo é converter dados brutos do csv inicial para um formato consistente.

Funcionalidades principais: 
Carregamento dos dados:
O script se inicia importando a biblioteca ‘pandas’.
Depois, lê o arquivo recebido, ainda não tratado, e carrega em um data frame.
Tratamento de dados:
Começa tratando a coluna ‘ativo’, convertendo os dados para String e padronizando os textos. Depois de padronizado, converte novamente para valor Booleano (Verdadeiro ou Falso).
Depois, começa a tratar a coluna ‘idade’, convertendo os dados para números inteiros.
Em seguida, passando para a coluna ‘nota’, converte os dados para o tipo Float.
Por último, são tratados os dados da coluna ‘data_inscricao’, convertendo os valores para o formato de data e hora.
Limpeza final:
Por último, o script remove qualquer linha que tenha valor nulo, deixando apenas os valores válidos.


