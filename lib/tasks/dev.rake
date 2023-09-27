namespace :dev do
  desc "Insert doctors"
  task add_doctors: :environment do
    30.times do |i|
      Doctor.create!(
        name: Faker::Name.name,
        crm: Faker::Number.number(digits: 10),
        crm_uf: %i(CE RJ SP RS MG BA SC PB).sample,
      )
    end
  end

  desc "Insert patients"
  task add_patients: :environment do
    100.times do |i|
      Patient.create!(
        name: Faker::Name.name,
        cpf: CPF.generate,
        birth_date: Faker::Date.between(from: "1949-09-23", to: "2014-09-25"),
      )
    end
  end

  medical_specialties = {
    "Anestesiologia" => "Especializa-se no alívio da dor e na administração de anestesia durante procedimentos cirúrgicos.",
    "Cardiologia" => "Lida com o diagnóstico e tratamento de condições e doenças relacionadas ao coração.",
    "Dermatologia" => "Especializa-se no diagnóstico e tratamento de doenças da pele, cabelo e unhas.",
    "Endocrinologia" => "Foca em distúrbios relacionados a hormônios e ao sistema endócrino.",
    "Gastroenterologia" => "Especializa-se no diagnóstico e tratamento de doenças relacionadas ao sistema digestivo.",
    "Hematologia" => "Lida com distúrbios do sangue e tecidos formadores de sangue.",
    "Doença Infecciosa" => "Concentra-se no diagnóstico e tratamento de infecções causadas por vários agentes.",
    "Nefrologia" => "Especializa-se no diagnóstico e tratamento de condições relacionadas aos rins.",
    "Neurologia" => "Lida com distúrbios do sistema nervoso, incluindo o cérebro e a medula espinhal.",
    "Obstetrícia e Ginecologia" => "Concentra-se na saúde reprodutiva das mulheres, gravidez e parto.",
    "Oftalmologia" => "Especializa-se no diagnóstico e tratamento de condições e doenças oculares.",
    "Ortopedia" => "Lida com o diagnóstico e tratamento de distúrbios musculoesqueléticos e lesões.",
    "Otorrinolaringologia" => "Foca em distúrbios do ouvido, nariz e garganta.",
    "Pediatria" => "Especializa-se nos cuidados médicos de lactentes, crianças e adolescentes.",
    "Psiquiatria" => "Lida com o diagnóstico, tratamento e prevenção de doenças mentais e transtornos.",
    "Pneumologia" => "Concentra-se no diagnóstico e tratamento de distúrbios e doenças respiratórias.",
    "Radiologia" => "Especializa-se em imagiologia médica e interpretação de exames de imagem.",
    "Reumatologia" => "Lida com distúrbios das articulações, músculos e tecidos conectivos.",
    "Cirurgia" => "Inclui várias especialidades cirúrgicas para diferentes áreas do corpo.",
    "Urologia" => "Especializa-se no diagnóstico e tratamento de distúrbios do trato urinário e sistema reprodutivo masculino.",
    "Medicina de Emergência" => "Concentra-se em fornecer cuidados médicos imediatos em situações de emergência.",
    "Medicina Física e Reabilitação" => "Lida com a restauração da capacidade funcional e melhoria da qualidade de vida.",
    "Genética Médica" => "Especializa-se no diagnóstico e manejo de distúrbios genéticos.",
    "Alergia e Imunologia" => "Concentra-se em distúrbios do sistema imunológico, incluindo alergias e doenças autoimunes.",
    "Medicina Nuclear" => "Envolve o uso de substâncias radioativas para diagnóstico e tratamento.",
    "Medicina da Dor" => "Especializa-se no gerenciamento e tratamento da dor crônica.",
    "Medicina do Sono" => "Lida com distúrbios relacionados ao sono e padrões de sono.",
    "Medicina Esportiva" => "Foca no tratamento e prevenção de lesões relacionadas a esportes e atividade física.",
    "Oncologia Médica" => "Especializa-se no diagnóstico e tratamento do câncer.",
    "Gerontologia" => "Concentra-se nos cuidados médicos e no bem-estar de pessoas idosas.",
    "Clínico Geral" => "Um médico de atenção primária que oferece uma ampla variedade de cuidados médicos a pacientes de todas as idades. Eles diagnosticam e tratam vários problemas de saúde, oferecem cuidados preventivos e encaminham pacientes para especialistas quando necessário. Os clínicos gerais atuam como o primeiro ponto de contato para as necessidades gerais de saúde.",
  }

  desc "Insert specialties"
  task add_specialty: :environment do
    medical_specialties.each do |key, value|
      Specialty.create!(
        name: key,
        description: value,
      )
    end
  end
end
