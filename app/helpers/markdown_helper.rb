module MarkdownHelper
  require "rouge/plugins/redcarpet"

  class HTML < Redcarpet::Render::HTML
    include Rouge::Plugins::Redcarpet
  end

  def convert_markdown!(input)
    options = {
      filter_html: true,
      hard_wrap: true
    }

    extensions = { strikethrough: true,
                   superscript: true,
                   underline: true,
                   highlight: true,
                   disable_indented_code_blocks: true,
                   space_after_headers: true,
                   fenced_code_blocks: true,
                   autolink: true,
                   lax_spacing: true,
                   no_intra_emphasis: true }

    renderer = HTML.new(options)
    markdown = Redcarpet::Markdown.new(renderer, extensions)
    # rubocop:disable Rails/OutputSafety
    markdown.render(input).html_safe
    # rubocop:enable Rails/OutputSafety
  end
end
