class HomePagesController < ApplicationController
  include ModalitiesConcern
  require 'ostruct'

  FRIENDS = [
    {
      nome: "James Peter",
      description: "Tecnico em redes e Engenheiro da computação Desenvolvedor full-stack. Programador Ruby, python e Go. (dica: Na duvida pergunte pro Rafa).",
      image: "friends/james.png",
      social_links: [
        { url: "https://github.com/Jmspter", icon: "icons/github.svg" },
        { url: "https://x.com/JmspterNeolib", icon: "icons/x.svg" },
        { url: "https://www.linkedin.com/in/james-barbosa-289842235/", icon: "icons/linkedin.svg" }
      ]
    },
    {
      nome: "Rafael Claudeniro",
      description: "Estudante de Engenharia de Software com 2 anos de experiência em desenvolvimento web full-stack e me especializando em Segurança da Informação.",
      image: "friends/rafa.png",
      social_links: [
        { url: "https://github.com/Rafazg", icon: "icons/github.svg" },
        { url: "https://www.linkedin.com/in/claudeniro-rafael/", icon: "icons/linkedin.svg" }
      ]
    },
    {
      nome: "Ana Luiza",
      description: "Estudo atualmente sobre todas as áreas da tec, confesso que fico encantanda pela cyber security! Meu objetivo é me tornar uma grande analista de dados.",
      image: "friends/ana.png",
      social_links: [
        { url: "https://github.com/Lolita0000", icon: "icons/github.svg" },
        { url: "https://x.com/AnaLuizaRo94736", icon: "icons/x.svg" },
        { url: "https://www.linkedin.com/in/ana-luiza-rodrigues-machado-625129274/", icon: "icons/linkedin.svg" }
      ]
    },
    {
      nome: "Isabela Castro",
      description: "Técnica em Desenvolvimento de Sistemas. Bacharelando em Ciência da Computação na UFSCar. Sou uma garota apaixonada por códigos e café!",
      image: "friends/isa.png",
      social_links: [
        { url: "https://github.com/IsabeladpCastro", icon: "icons/github.svg" },
        { url: "https://www.linkedin.com/in/isabela-castro-43299125a/", icon: "icons/linkedin.svg" }
      ]
    },
    {
      nome: "Mateus Souza",
      description: "Atualmente graduando em tecnólogo em Análise e Desenvolvimento de Sistemas, programador Java e Angular, busco ser um desenvolvedor FullStack.",
      image: "friends/mateus.png",
      social_links: [
        { url: "https://github.com/MattSouza14", icon: "icons/github.svg" },
        { url: "https://www.linkedin.com/in/mateus-souza-025b48232/", icon: "icons/linkedin.svg" }
      ]
    },
    {
      nome: "Saymon Medeiros",
      description: "24 anos, sou apaixonado por tecnologia. Atualmente focado nos estudos de HTML e CSS. Objetivo é me tornar um desenvolvedor fullstack.",
      image: "friends/saymon.png",
      social_links: [
        { url: "https://github.com/saymonmedeiros/", icon: "icons/github.svg" },
        { url: "https://www.linkedin.com/in/saymon-medeiros-2b5025232/", icon: "icons/linkedin.svg" }
      ]
    },
    {
      nome: "Renata O. Aguia",
      description: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s.",
      image: "friends/reh.png",
      social_links: [
        { url: "https://www.linkedin.com/in/rehoaguiar/", icon: "icons/linkedin.svg" }
      ]
    }
  ]

  def home_on 
    @articles = Article.all
  end

  def home_off; end

  def privacy_policy; end

  def terms_of_use; end

  def about
    @friends = FRIENDS.map { |friend| OpenStruct.new(friend) }
  end
end
