module ApplicationHelper
   def page_title
     title = "やまのかたりば"
     title = @page_title + "-" + title if @page_title
     title
   end

   def menu_link_to(text, path, options = {}) #リンクメソッド
     content_tag :li do
       link_to_unless_current(text, path, options) do #現在のページならテキスト強調
         content_tag(:span,text)
       end
     end
   end
end
