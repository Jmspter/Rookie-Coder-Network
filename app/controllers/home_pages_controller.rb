class HomePagesController < ApplicationController
  include ModalitiesConcern

  def home_on
    @color1 = "%06x" % (rand * 0xffffff)
    @color2 = "%06x" % (rand * 0xffffff)
  end

  def home_off
  end
end
