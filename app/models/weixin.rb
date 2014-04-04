#encoding: utf-8
require 'digest/sha1'
class Weixin
  # def initizite
  #   @wx_token = "weiguo_hzrwdzwf_2014"
  # end
  class << self
    
    def wx_token
      @wx_token = "weiguo_hzrwdzwf_2014"
    end
  
    def weixin_token?(token_arr=[],signature)
      @wx_token = wx_token
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
    
    
    def menu_test
      {
        button: [
          {
            type: 'click',
            name: 'menu1',
            key: 'v001'
          },
          {
            type: 'view',
            name: 'menu2',
            url: 'http://v.qq.com/'
          },
          {
            name: 'menu3',
            sub_button: [
              {
                type: 'click',
                name: 'text01',
                key: 't001'
              },
              {
                type: 'view',
                name: 'text02',
                url: 'http://www.soso.com/'
              }
            ]
          }
        ]
      }
    end
    
  end
  
end