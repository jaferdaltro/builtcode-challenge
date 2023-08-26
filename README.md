# Medical Attendance

## Listagem de médicos <br/>
- Criar uma tela que lista os médicos cadastrados no sistema. 
- Cada registro deve possuir a opção de edição e exclusão.

## Cadastro de médicos
- Criar uma tela de cadastro/edição de médicos.
- O sistema não pode permitir o cadastro de médicos com CRM duplicados, sendo que o CRM do médico é composto pelo número do CRM e o estado do CRM (Crm + CrmUf).
    - Todos os atributos são obrigatórios.

## Exclusão de médicos
- Criar a funcionalidade de exclusão de médicos.
- Não deve ser possível excluir médicos que possuam pacientes vinculados.

## Listagem de pacientes
- Criar uma tela que lista os pacientes cadastrados no sistema. 
- Cada registro deve possuir a opção de edição e exclusão.

## Criação de pacientes
- Criar uma tela de criação/edição de pacientes.
- Todos os atributos são obrigatórios
- O sistema não deve permitir cadastro de pacientes com CPF duplicado.
- O sistema não deve permitir cadastro de pacientes com CPF inválido

## Exclusão de pacientes
- Criar a funcionalidade de exclusão de pacientes.

## Cadastro de consultas
- Criar uma tela de cadastro/edição de consultas.
- O horário de atendimento é das 9 às 18, com intervalo de almoço das 12 às 13.
- Cada consulta pode durar 30 minutos.
- O sistema não deve permitir cadastro de uma consulta, num horário já ocupado por outra.
- Todos os atributos são obrigatórios.

## Dashboard
- Criar uma tela para listar os seguintes dados, filtrados por médico, com a opção de visualizar de todos os médicos, sendo essa a visão padrão.
- Deve ser possível filtrar por médico
- O filtro padrão deve ser “Todos os médicos”
- Mostrar a quantidade de consultas que já foram realizadas
- Mostrar a quantidade de pacientes diferentes atendidos no período
