FactoryBot.define do
  factory :response, class: OpenStruct do
    url '/programacao/109424_MOVE+NATACAO'
    image_url '/files/programacao/eaf95f37-4209-4649-8d0e-75234e2ee3fc.jpg'
    availability nil
    category 'Esporte e Atividade Física'
    title 'Move Natação'
    date '03/01 a 30/12'
    hours 'Diversos Horários'
    place 'SESC Vila Mariana'
    description 'Projeto que estimula a prática autônoma da natação, por meio de treinos pré-montados, disponíveis na...'
    age_limit 'Não recomendado para menores de 12 anos'
    price 'Grátis'
  end
end
