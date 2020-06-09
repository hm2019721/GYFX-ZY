# Loon全局配置 
# 电报频道: https://t.me/hm2019721
# YouTube去广告请删除hostname 后的.bak

[General]
ipv6 = false
skip-proxy = 10.0.0.0/8,127.0.0.0/8,169.254.0.0/16,192.0.2.0/24,192.168.0.0/16,198.51.100.0/24,224.0.0.0/4,172.16.0.0/12,100.64.0.0/10,*.local,e.crashlytics.com,captive.apple.com
bypass-tun = 10.0.0.0/8,127.0.0.0/8,169.254.0.0/16,192.0.2.0/24,192.168.0.0/16,198.51.100.0/24,224.0.0.0/4,172.16.0.0/12,100.64.0.0/10

# [DNS] => DNS 服务器
dns-server = system,1.2.4.8,119.29.29.29,223.5.5.5
allow-udp-proxy = true
host = 127.0.0.1

[Remote Proxy]
# 订阅节点
# 别名 = 订阅URL

[Remote Filter]



# 筛选订阅节点，筛选后的结果可加入到策略组中，目前支持三种筛选方式
# NodeSelect: 使用在UI上选择的节点。
# NameKeyword: 根据提供的关键词对订阅中所有节点的名称进行筛选，使用筛选后的节点。
# NameRegex: 根据提供的正则表达式对订阅中所有节点的名称进行筛选，使用筛选后的节点。

[Proxy]

# 本地节点

# 内置 DIRECT、REJECT 策略

# 节点名称 = 协议，服务器地址，服务器端口，加密协议，密码，
# vmess
# 节点名称 = 协议，服务器地址，端口，加密方式，UUID，传输方式:(tcp/ws),path：websocket握手header中的path，host：websocket握手header中的path，over-tls:是否tls，tls-name：远端w服务器域名，skip-cert-verify：是否跳过证书校验（默认否）
#5 = vmess, 1.2.3.4, 10086, aes-128-gcm,”uuid“,transport:ws,path:/,host:icloud.com,over-tls:true,tls-name:youtTlsServerName.com,skip-cert-verify:false

# 解锁网易云音乐灰色歌曲

[Proxy Group]
# 策略组

# 节点选项
# select模式,手动选择模式
🔰节点选择 = select,♻️自动选择,🟢健康检测

♻️自动选择 = url-test,,url = http://www.qualcomm.cn/generate_204,interval = 150
🟢健康检测 = fallback,,url = http://www.qualcomm.cn/generate_204,interval = 60

# url-test模式，给提供的url发出http header请求，根据返回结果，选择测速最快的节点，默认间隔600s，测速超时时间5s，为了避免资源浪费，建议节点数不要过多，只支持单个节点和远端节点，其他会被忽略

# fallback模式，和url-test类似，不同的是会根据顺序返回第一个可用的节点，为了避免资源浪费，建议节点数不要过多，只支持单个节点和远端节点，其他会被忽略
🔘网络识别 = ssid,default = 🔰节点选择, cellular = DIRECT
🎬国际媒体 = select,🔰节点选择,🎯国内直连
💳贝宝支付 = select,🔰节点选择,🎯国内直连
📱电报吹水 = select,🔰节点选择,🎯国内直连
🔞珀恩哈波 = select,🔰节点选择,🎯国内直连
# 网络测速
🚀网络测速 = select,🔰节点选择,🎯国内直连
# 苹果服务
🍎苹果服务 = select,🎯国内直连,🔰节点选择
# 直接连接
🎯国内直连 = select,DIRECT
# 广告拦截
🚫广告与屏蔽 = select,⛔️拦截,🎯国内直连
# 白名单模式 PROXY，黑名单模式 DIRECT
🕹黑白名单 = select,🔰节点选择,🎯国内直连
# 拦截
⛔️拦截 = select,REJECT

# SSID
# 别名 = ssid，默认 = 策略， 蜂窝 = 策略， ssid名称 = 策略
#SSID = ssid, default = PROXY, cellular = DIRECT, ”DivineEngine“ = PROXY


[Rule]
# 本地规则
# Type:DOMAIN-SUFFIX,DOMAIN,DOMAIN-KEYWORD,USER-AGENT,URL-REGEX,IP-CIDR
# Strategy:DIRECT,Proxy,REJECT
# Options:force-remote-dns(Default:false),no-resolve

#  𝐍𝐞𝐭𝐞𝐚𝐬𝐞𝐌𝐮𝐬𝐢𝐜
DOMAIN-SUFFIX,music.126.net,DIRECT

# GeoIP China
GEOIP,CN,🎯𝐃𝐢𝐫𝐞𝐜𝐭
FINAL,🕹黑白名单

[Remote Rule]

# 订阅规则⬇️
https://raw.githubusercontent.com/eHpo1/Rules/master/Surge4/Ruleset/Liby.list, policy=🚫广告与屏蔽, tag=去广告, enabled=true
# BlockOTA屏蔽系统更新⬇️
https://raw.githubusercontent.com/nzw9314/Surge/master/Ruleset/BlockOTA.list, policy=🚫广告与屏蔽, tag=ios屏蔽更新, enabled=true
# Antirevoke无视证书失效⬇️
https://raw.githubusercontent.com/nzw9314/Surge/master/Ruleset/Antirevoke.list, policy=🚫广告与屏蔽, tag=无视证书失效, enabled=true
# > TikTok ⬇️
https://raw.githubusercontent.com/nzw9314/Surge/master/Ruleset/TikTok.list, policy=🎵国际抖音, tag=Tiktok, enabled=true
# > Youtube ⬇️
https://raw.githubusercontent.com/eHpo1/Rules/master/Surge4/Ruleset/Sub/YouTube.list, policy=🎬国际媒体, tag=油管, enabled=true
# > Netflix ⬇️
https://raw.githubusercontent.com/eHpo1/Rules/master/Surge4/Ruleset/Sub/Netflix.list, policy=🎬国际媒体, tag=奈飞, enabled=true
# > PronHub ⬇️
https://raw.githubusercontent.com/eHpo1/Rules/master/Surge4/Ruleset/Sub/Pornhub.list, policy=🔞珀恩哈波, tag=P站, enabled=true
# Telegram ⬇️
https://raw.githubusercontent.com/eHpo1/Rules/master/Surge4/Ruleset/Sub/Telegram.list, policy=📱电报吹水, tag=电报, enabled=true
# > PayPal ⬇️
https://raw.githubusercontent.com/eHpo1/Rules/master/Surge4/Ruleset/Sub/PayPal.list, policy=💳贝宝支付, tag=贝宝, enabled=true
# > Outlook、Gmail ⬇️
https://raw.githubusercontent.com/nzw9314/Surge/master/Ruleset/Mail.list, policy=🔰节点选择, tag=节点选择, enabled=true
# > GoogleDrive ⬇️
https://raw.githubusercontent.com/nzw9314/Surge/master/Ruleset/GoogleDrive.list, policy=🔰节点选择, tag=节点选择, enabled=true
# Speedtest ⬇️
https://raw.githubusercontent.com/lhie1/Rules/master/Surge/Surge%203/Provider/Speedtest.list, policy=🚀网络测速, tag=测速, enabled=true
# 苹果服务⬇️
https://raw.githubusercontent.com/eHpo1/Rules/master/Surge4/Ruleset/Apple_CDN.list, policy=🍎苹果服务, tag=苹果服务, enabled=true
https://raw.githubusercontent.com/eHpo1/Rules/master/Surge4/Ruleset/Apple_API.list, policy=🍎苹果服务, tag=苹果服务, enabled=true

https://raw.githubusercontent.com/eHpo1/Rules/master/Surge4/Ruleset/AsianMedia.list, policy=🎯国内直连, tag=国内直连, enabled=true
https://raw.githubusercontent.com/eHpo1/Rules/master/Surge4/Ruleset/GlobalMedia.list, policy=🔰节点选择, tag=节点选择, enabled=true

https://raw.githubusercontent.com/eHpo1/Rules/master/Surge4/Ruleset/Domestic.list, policy=🎯国内直连, tag=国内直连, enabled=true
https://raw.githubusercontent.com/eHpo1/Rules/master/Surge4/Ruleset/Global.list, policy=🔰节点选择, tag=节点选择, enabled=true

[URL Rewrite]
# 本地重写
# > TikTok Unlock (By Choler)
# 区域请修改下方国家代码，默认为日本 JP

(?<=_region=)CN(?=&) IN 307
(?<=&app_version=)16..(?=.?.?&) 1 307
(?<=\?version_code=)16..(?=.?.?&) 1 307

# > 抖音 去广告&水印
# 需配合脚本使用
#^https?:\/\/[\w-]+\.amemv\.com\/aweme\/v\d\/feed\/ https://aweme.snssdk.com/aweme/v1/feed/ header
#^https?:\/\/[\w-]+\.amemv\.com\/aweme\/v\d\/aweme\/post\/ https://aweme.snssdk.com/aweme/v1/aweme/post/ header
#^https?:\/\/[\w-]+\.amemv\.com\/aweme\/v\d\/follow\/feed\/ https://aweme.snssdk.com/aweme/v1/follow/feed/ header
#^https?:\/\/[\w-]+\.amemv\.com\/aweme\/v\d\/nearby\/feed\/ https://aweme.snssdk.com/aweme/v1/nearby/feed/ header
#^https?:\/\/[\w-]+\.amemv\.com\/aweme\/v\d\/search\/item\/ https://aweme.snssdk.com/aweme/v1/search/item/ header
#^https?:\/\/[\w-]+\.amemv\.com\/aweme\/v\d\/general\/search\/single\/ https://aweme.snssdk.com/aweme/v1/general/search/single/ header
#^https?:\/\/[\w-]+\.amemv\.com\/aweme\/v\d\/hot/search\/video\/list\/ https://aweme.snssdk.com/aweme/v1/hot/search/video/list/ header

enable = true

[Remote Rewrite]
#订阅重写 去广告 by eHpo
https://raw.githubusercontent.com/eHpo1/Rules/master/Loon/Rewrite.conf, tag=eHpo, enabled=true


https://raw.githubusercontent.com/nzw9314/Loon/master/Q-Search_All_in_one.conf, tag=nzw9314, enabled=true

[Script]
# 本地脚本

# 百度签到
# 打开App,点击'我的'
cron "05 0 0 * * *" script-path=https://raw.githubusercontent.com/NobyDa/Script/master/BDTieBa-DailyBonus/TieBa.js, tag=百度贴吧

# 中国联通
#1打开 APP , 进入签到页面, 系统提示: `获取刷新链接: 成功`,然后手动签到 1 次
#2首页>天天抽奖, 系统提示 `2` 次: `获取Cookie: 成功 (登录抽奖)` 和 `获取Cookie: 成功 (抽奖次数)`
cron "30 0 0 * * *" script-path=https://raw.githubusercontent.com/chavyleung/scripts/master/10010/10010.js, tag=中国联通


# 快手极速版 (By @Macsuny)
#APP登陆账号后，点击’钱包‘
cron "50 0 0 * * *" script-path=https://raw.githubusercontent.com/Sunert/Scripts/master/Task/kuaishou.js, tag=快手极速版

# > 一言
cron "0 0 8 * * *" script-path=https://raw.githubusercontent.com/nzw9314/QuantumultX/master/Meeta/Surge/Scripting/Calendar.js, tag=一言+历史上的今天

# > 倒数日
# 需要自己修改节日
cron "0 8 * * *" script-path=https://raw.githubusercontent.com/nzw9314/QuantumultX/master/Task/daysmatter.js, tag=倒数日

# > 实时汇率计算(By @Macsuny)
cron "0 23 * * *" script-path=https://raw.githubusercontent.com/Sunert/Scripts/master/Task/exchangeRate.js, tag=实时货币换算



enable = true

[Remote Script]
# 远程脚本

#https://raw.githubusercontent.com/nzw9314/Loon/master/Task.conf, tag=签到, enabled=false

https://raw.githubusercontent.com/nzw9314/Loon/master/Script.conf, tag=脚本, enabled=true

https://raw.githubusercontent.com/nzw9314/Loon/master/Cookie.conf, tag=Cookie, enabled=true

[MITM]
enable = true
hostname = *.googlevideo.com
skip-server-cert-verify = true
ca-p12 = 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
ca-passphrase = eHpo