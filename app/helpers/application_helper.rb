module ApplicationHelper
   # language as arguments and so we pass it $3 which matches the text between the code tags and 
   # $2 which matches the content of the lang attribute. It then calls .div on that to return the output wrapped in a div element. 
   # The :css => :class option tells CodeRay what type of CSS styling to do. 
  def coderay(text)  
    text.gsub(/\<code( lang="(.+?)")?\>(.+?)\<\/code\>/m) do  
      content_tag('notextile', CodeRay.scan($3, $2).div(:css => :class).html_safe)
    end  
  end  
  
end
