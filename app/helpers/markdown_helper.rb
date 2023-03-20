require 'redcarpet'

module MarkdownHelper

  def convert_markdown(input)
    # define basic MD renderer
    renderer = Redcarpet::Render::HTML.new(hard_wrap: true)
    markdown = Redcarpet::Markdown.new(renderer, extensions = {})
    markdown.render(input).html_safe
  end

end
