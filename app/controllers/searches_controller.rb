class SearchesController < ApplicationController
  before_action :authenticate_user!
  
  def search
    @userbook = params[:model]
    # _search.erbの検索対象UserまたはBookを＠modelに入れる
    @content = params[:content]
    # s.text_field :contentの内容を＠contentに代入
    @matches = params[:method]
    # 完全一致等の検索方法を＠@matchに代入
    if @userbook == "user"
      # 検索対象がUserだった場合
      @results = User.search_for(@content, @matches)
    else
      # 検索対象がBookだった場合
      @results = Book.search_for(@content, @matches)
    end
  end
  
end
