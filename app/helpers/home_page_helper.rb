module HomePageHelper
    def markdown(text) #https://web-crunch.com/posts/how-to-add-markdown-support-to-ruby-on-rails
        options = [:hard_wrap, :autolink, :no_intra_emphasis, :fenced_code_blocks]
        Markdown.new(text, *options).to_html.html_safe
    end
end
