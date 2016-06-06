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

  private
  def set_params
    params.require(:short_url_list).permit(:redirect_to)
  end
end
