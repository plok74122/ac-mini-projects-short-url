class ShortUrlController < ApplicationController
  before_action :set_params, :only => :create

  def new
    @short_url = ShortUrlList.new
  end

  def create
    @short_url = ShortUrlList.find_by_redirect_to(set_params["redirect_to"]) || ShortUrlList.new(set_params)
    if @short_url.new_record?
      if !@short_url.save
        # ActiveRecord validates 錯誤訊息使用方式參考
        # http://guides.rubyonrails.org/active_record_validations.html#working-with-validation-errors
        render :new
      end
    end
  end
  def show
    # set_unique_string是一個Hash Parameters: {"unique_string"=>"959ee2a935"}
    # 運用find_by 放入一個Hash會產生的SQL語法
    # SELECT  "short_url_lists".* FROM "short_url_lists" WHERE "short_url_lists"."unique_string" = ? LIMIT 1  [["unique_string", "959ee2a935"]]
    @short_url = ShortUrlList.find_by(set_unique_string)
    if @short_url.present?
      redirect_to @short_url.redirect_to
    else
      flash[:notice]='Short Url is not exist!'
      redirect_to new_short_url_url
    end
  end
  private
  def set_params
    params.require(:short_url_list).permit(:redirect_to)
  end
  def set_unique_string
    params.permit(:unique_string)
  end
end
