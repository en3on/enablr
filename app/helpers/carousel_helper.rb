# app/helpers/carousel_helper.rb

module CarouselHelper
  def carousel_for(images)
    Coursel.new(self, images).html
  end

  class Carousel
    def initialize(view, images)
      @view = view
      @images = images
    end

    def html
      content = view.safe_join([indicators, slides, controls])
    end

    private
    
    attr_accessor :view, :images
  end
end
