module ApplicationHelper
    def estiloBotao(text, path, options = {})
    classes = "rounded-md px-3.5 py-2.5 bg-[#FF5C13] text-white font-medium hover:brightness-110 transition"
    link_to text, path, { class: classes }.merge(options)
    end

    # app/helpers/application_helper.rb
  def estiloBotaoSubmit(text)
  tag.input type: "submit", value: text, class: "rounded-md px-3.5 py-2.5 bg-[#FF5C13] text-white font-medium hover:brightness-110 transition cursor-pointer"
  end

end
