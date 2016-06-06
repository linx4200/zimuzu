require 'mechanize'  #gem install mechanize

class Dosign
  def initialize(account, password)
    @agent = Mechanize.new
    @account = account
    @password = password
  end

  def login
    resp = @agent.post('http://www.zimuzu.tv/User/Login/ajaxLogin', {
      :account => @account,
      :password => @password
    })
  end

  def dosign
    # 先访问这个页面伪造 PHPSESSID
    resp = @agent.get 'http://www.zimuzu.tv/user/sign'

    # 限制15秒以上
    sleep 16

    # 签到
    resp = @agent.get 'http://www.zimuzu.tv/user/sign/dosign'

    time = Time.new.strftime("%Y-%m-%d %H:%M:%S")

    body = JSON.parse(resp.body)
    if JSON.parse(resp.body)['status'] == 1
      puts time.to_s + ' 签到成功!'
    else
      puts time.to_s + ' 签到失败'
    end
  end

  def main
    # 先登录获取cookie, 同一个@agent 可以共享 cookie
    login
    # 再签到
    # 原有的签到方式改为累计登录天数,已签到的天数会自动转化为累计登录天数,每天通过浏览器或APP登录网站计为一个登录天数。
    # dosign
  end
end

dosign = Dosign.new('username', '*******')
dosign.main