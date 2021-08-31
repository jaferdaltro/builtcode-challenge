Requisito 1: Listagem de médicos
Criar uma tela que lista os médicos cadastrados no sistema. Cada registro deve possuir a opção de edição e exclusão.

Requisito 2: Cadastro de médicos
Criar uma tela de cadastro/edição de médicos.
Regra de negócio 2.1: O sistema não pode permitir o cadastro de médicos com CRM duplicados, sendo que o CRM do médico é composto pelo número do CRM e o estado do CRM (Crm + CrmUf).
Regra de negócio 2.2: Todos os atributos são obrigatórios.

Requisito 3: Exclusão de médicos
Criar a funcionalidade de exclusão de médicos.
Regra de negócio 3.1: Não deve ser possível excluir médicos que possuam pacientes vinculados.

Requisito 4: Listagem de pacientes
Criar uma tela que lista os pacientes cadastrados no sistema. Cada registro deve possuir a opção de edição e exclusão.

Requisito 5: Criação de pacientes
Criar uma tela de criação/edição de pacientes.
Regra de negócio 5.1: Todos os atributos são obrigatórios
Regra de negócio 5.2: O sistema não deve permitir cadastro de pacientes com CPF duplicado.
Regra de negócio 5.3: O sistema não deve permitir cadastro de pacientes com CPF inválido

Requisito 6: Exclusão de pacientes
Criar a funcionalidade de exclusão de pacientes.

Requisito 7: Cadastro de consultas
Criar uma tela de cadastro/edição de consultas.
Regra de negócio 7.1: O horário de atendimento é das 9 às 18, com intervalo de almoço das 12 às 13.
Regra de negócio 7.2: Cada consulta pode durar 30 minutos.
Regra de negócio 7.3: O sistema não deve permitir cadastro de uma consulta, num horário já ocupado por outra.
Regra de negócio 7.4: Todos os atributos são obrigatórios.

Requisito 8: Dashboard
Criar uma tela para listar os seguintes dados, filtrados por médico, com a opção de visualizar de todos os médicos, sendo essa a visão padrão.
Regra de negócio 8.1: Deve ser possível filtrar por médico
Regra de negócio 8.2: O filtro padrão deve ser “Todos os médicos”
Regra de negócio 8.3: Mostrar a quantidade de consultas que já foram realizadas
Regra de negócio 8.4: Mostrar a quantidade de pacientes diferentes atendidos no período
