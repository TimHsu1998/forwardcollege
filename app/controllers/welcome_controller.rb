class WelcomeController < ApplicationController
  def index
   flash[:notice]  =  "各位邁卓的朋友，趕快把你的百日任務ＰＯ上來ㄚ"
  end
end
