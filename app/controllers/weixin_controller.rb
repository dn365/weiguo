#encoding: utf-8
class WeixinController < ApplicationController
  before_filter :weixin_tokeb_params
  # layout "weixin"
  def index
    @echostr = params[:echostr]
    @signature = params[:signature]
    @tocken_arr = weixin_tokeb_params
    if Weixin.weixin_token?(@tocken_arr,@signature)
      render text: @echostr
    else
      render text: "Forbidden", status: 403
    end
    
  end
  
  def reply
    @signature = params[:signature]
    @query_type = params[:xml][:MsgType]
    @query_content = params[:xml][:Content]
    @tocken_arr = weixin_tokeb_params
    if Weixin.weixin_token?(@tocken_arr,@signature)
      case @query_type
      when "text"
        @message = Weixin.text_message(@query_content)
        render "echo", :formats => :xml
      when "image"
        render "echo", :formats => :xml
      when "event"
        if params[:xml][:Event].to_s == "subscribe"
          @message = "谢谢您的订阅,请多多关注微果为您提供的最新消息哦!"
          render "echo", :formats => :xml
        else 
          @message = "谢谢关注哦!"
          render "echo", :formats => :xml
        end
      else
        render text: "Forbidden", status: 403
      end
    else
      render text: "Forbidden", status: 403
    end
  end
  
  private
  
  def weixin_tokeb_params
    [params[:timestamp], params[:nonce]]
  end
  
end
