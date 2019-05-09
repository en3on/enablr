# app/helpers/carousel_helper.rb

module CarouselHelper
  def carousel_for(project, is_owner)
    pictures = project.picture
    Carousel.new(self, project, pictures, is_owner).html
  end

  class Carousel
    attr_accessor :view
    delegate :link_to, :content_tag, :image_tag, :safe_join, to: :view

    def initialize(view, project, pictures, is_owner)
      @view = view
      @project = project
      @pictures = pictures
      @is_owner = is_owner
    end

    def html
      content = view.safe_join([indicators, slides, controls])
      options = {
        id: "carousel-#{@project.id}",
        class: 'carousel slide carousel-size',
        data: { ride: false }
      }

      content_tag(:div, content, options)
    end

    def indicators
      items = @pictures.count.times.map { |index| indicator_tag(index) }
      options = {
        class: 'carousel-indicators'
      }

      content_tag(:ol, safe_join(items), options)
    end

    def indicator_tag(index)
      options = {
        class: index.zero? ? 'active' : '',
        data: {
          target: "#carousel-#{@project.id}",
          'slide-to': index
        }
      }

      content_tag(:li, nil, options)
    end

    def slides
      slides = @pictures.map.with_index do |picture, index|
        slide_tag(picture, index)
      end
      options = {
        class: 'carousel-inner'
      }

      content_tag(:div, safe_join(slides), options)
    end

    def slide_tag(picture, index)
      picture_options = {
        class: 'd-block w-100'
      }
      slide_pic = image_tag(picture, picture_options)
      caption = slide_caption(picture)

      content = @is_owner ? safe_join([slide_pic, caption]) : slide_pic

      options = {
        class: index.zero? ? 'carousel-item active' : 'carousel-item'
      }

      content_tag(:div, content, options)
    end

    def slide_caption(picture)
      i_tag = content_tag(:i, nil, class: 'fas fa-trash delete-pic-icon')

      options = {
        class: 'carousel-caption d-none d-md-block'
      }

      link_options = {
        method: :delete,
        data: { confirm: 'Are you sure?' }
      }

      link = link_to(i_tag, "/project/#{@project.id}/pictures/#{picture.id}", link_options)

      content_tag(:div, link, options)
    end

    def controls
      safe_join([controller('prev'), controller('next')])
    end

    def controller(direction)
      icon = icon_tag(direction)

      options = {
        class: "carousel-control-#{direction}",
        role: 'button',
        data: { slide: direction }
      }

      link_to(icon, "#carousel-#{@project.id}", options)
    end

    def icon_tag(direction)
      spans = Array.new(2) do |index|
        options = {
          class: index.zero? ? "carousel-control-#{direction}-icon" : 'sr-only'
        }
        content = index.zero? ? nil : direction.capitalize
        content_tag(:span, content, options)
      end

      safe_join(spans)
    end
  end
end
