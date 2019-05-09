#app/helpers/progress_bar_helper.rb

module ProgressBarHelper
  def progress_bar_for(project)
    percent = project.percentage.round
    ProgressBar.new(self, percent).html
  end

  class ProgressBar
    attr_accessor :view
    delegate :link_to, :content_tag, :safe_join, to: :view

    def initialize(view, percent)
      @percent = percent
      @view = view
    end

    def html
      bar = progbar
      options = {
        class: 'progress'
      }

      content_tag(:div, bar, options)
    end

    def progbar
      options = {
        class: 'progress-bar',
        role: 'progressbar',
        style: "width:#{@percent}%",
        'aria-valuenow': @percent,
        'aria-valuemin': 0,
        'aria-valuemax': 100
      }

      content_tag(:div, "#{@percent}%", options)
    end
  end
end
