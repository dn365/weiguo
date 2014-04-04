namespace :weixin do
  
  desc "post menu json to weixin api"
  task :weixin_menu => :environment do
    token = Weixin.wx_token
    appid = "gh_bccee9f4c2e2"
    
    gurl = "https://api.weixin.qq.com/cgi-bin/token?grant_type=client_credential&appid=#{appid}&secret=#{token}"
    
    acc_toke = RestClient.get gurl
    
    
    p acc_toke
    
    url = "https://api.weixin.qq.com/cgi-bin/menu/create?access_token=#{token}"
    
    menu = Weixin.menu_test
    p menu.to_json
    exit
    response =  RestClient.post url, menu.to_json
    p response
  end
  
  
end