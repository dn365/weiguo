#encoding: utf-8
require 'digest/sha1'
class Weixin
  
  class << self
  
    def weixin_token?(token_arr=[],signature)
      @wx_token = "weiguo_hzrwdzwf_2014"
      return Digest::SHA1.hexdigest(([@wx_token] + token_arr).sort.join) == signature ? true : false
    end
    
    
    def text_message(t_string)
      message = "谢谢您的订阅,请多多关注微果为您提供的最新消息哦!"
      case t_string
      when /查看/
        message = "鲜果咨询正在完善..."
      end
      return message
    end
    
  end
  
end