# frozen_string_literal: true

module Sesc
  class Cli
    module Filter
      CITIES = {
        'Grande São Paulo' => [
          ['24 de Maio', 36],
          ['Belenzinho', 25],
          ['Bom Retiro', 72],
          ['Campo Limpo', 681],
          ['Carmo', 1],
          ['Centro de Pesquisa e Formação', 601],
          ['CineSesc', 2],
          ['Consolação', 3],
          ['Florêncio de Abreu', 7],
          ['Interlagos', 4],
          ['Ipiranga', 5],
          ['Itaquera', 6],
          ['Osasco', 69],
          ['Parque Dom Pedro II', 781],
          ['Pinheiros', 10],
          ['Pompeia', 11],
          ['Santana', 38],
          ['Santo Amaro', 26],
          ['Santo André', 37],
          ['São Caetano', 12],
          ['Vila Mariana', 13]
        ],
        'Interior e litoral' => [
          ['Araraquara', 32],
          ['Bauru', 14],
          ['Bertioga', 15],
          ['Birigui', 28],
          ['Campinas', 16],
          ['Catanduva', 17],
          ['Jundiaí', 741],
          ['Piracicaba', 18],
          ['Presidente Prudente', 68],
          ['Registro', 761],
          ['Ribeirão Preto', 19],
          ['Rio Preto', 22],
          ['Santos', 20],
          ['Sorocaba', 39],
          ['São Carlos', 21],
          ['São José dos Campos', 23],
          ['Taubaté', 24]
        ]
      }
    end
  end
end
