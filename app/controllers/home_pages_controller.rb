class HomePagesController < ApplicationController
  include ModalitiesConcern
  require 'ostruct'

  def home_on
  end

  def home_off
  end

  def about
    @friends = [
      OpenStruct.new(
        nome: "James Peter",
        description: "Tecnico em redes e Engenheiro da computação Desenvolvedor full-stack. Programador Ruby, python e Go. (dica: Na duvida pergunte pro Rafa).",
        image: "friends/james.png",
        social_links: [{ url: "https://github.com/Jmspter", icon: "icons/github.svg" }]
      ),
      OpenStruct.new(
        nome: "Rafael Claudeniro",
        description: "Estudante de Engenharia de Software com 2 anos de experiência em desenvolvimento web full-stack e me especializando em Segurança da Informação.",
        image: "friends/rafa.png",
        social_links: nil # Ou {}, se preferir representar a ausência de links com um hash vazio
      ),
      OpenStruct.new(
        nome: "Ana Luiza",
        description: "Estudo atualmente sobre todas as áreas da tec, confesso que fico encantanda pela cyber security! Meu objetivo é me tornar uma grande analista de dados.",
        image: "friends/ana.png",
        social_links: nil
      ),
      OpenStruct.new(
        nome: "Isabela Castro",
        description: "Técnica em Desenvolvimento de Sistemas. Bacharelando em Ciência da Computação na UFSCar. Sou uma garota apaixonada por códigos e café!",
        image: "friends/isa.png",
        social_links: nil
      ),
      OpenStruct.new(
        nome: "Mateus Souza",
        description: "Atualmente graduando em tecnólogo em Análise e Desenvolvimento de Sistemas, programador Java e Angular, busco ser um desenvolvedor FullStack.",
        image: "friends/mateus.png",
        social_links: nil
      ),
      OpenStruct.new(
        nome: "Saymon Medeiros",
        description: "24 anos, sou apaixonado por tecnologia. Atualmente focado nos estudos de HTML e CSS. Objetivo é me tornar um desenvolvedor fullstack.",
        image: "friends/saymon.png",
        social_links: nil
      ),
      OpenStruct.new(
        nome: "Renata O. Aguia",
        description: "",
        image: "friends/reh.png",
        social_links: nil
      )
    ]
  end
end
