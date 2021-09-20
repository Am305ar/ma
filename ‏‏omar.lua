http = require("socket.http")
https = require("ssl.https")
JSON = dofile("./lib/dkjson.lua")
json = dofile("./lib/JSON.lua")
URL = dofile("./lib/url.lua")
serpent = dofile("./lib/serpent.lua")
redis = dofile("./lib/redis.lua").connect("127.0.0.1", 6379)
Server_Devid = io.popen("echo $SSH_CLIENT  awk '{ print $1}'"):read('*a')
------------------------------------------------------------------------------------------------------------
local function Load_File()
local f = io.open("./Info_Sudo.lua", "r")  
if not f then   
if not redis:get(Server_Devid.."Token_Devbot") then
io.write('\n\27[1;35mSend Token For Bot : ارسل توكن البوت ...\n\27[0;39;49m')
local token = io.read()
if token ~= '' then
local url , res = https.request('https://api.telegram.org/bot'..token..'/getMe')
local User_Info_bot = JSON.decode(url) 
if res ~= 200 then
io.write('\n\27[1;31mToken Is Communication Error\n التوكن غلط جرب مره اخره \n\27[0;39;49m')
else
io.write('\n\27[1;31m• Done Save Token : تم حفظ التوكن \n\27[0;39;49m')
redis:set(Server_Devid.."Token_Devbot",token)
redis:set(Server_Devid.."Token_Devbotuser",User_Info_bot.result.username)
end 
else
io.write('\n\27[1;31mToken was not saved \n لم يتم حفظ التوكن \n\27[0;39;49m')
end 
os.execute('lua omar.lua')
end
------------------------------------------------------------------------------------------------------------
if not redis:get(Server_Devid.."User_Devbots1") then
io.write('\n\27[1;35m⬇Send UserName For Sudo : ارسل معرف المطور الاساسي ...\n\27[0;39;49m')
local User_Sudo = io.read()
if User_Sudo ~= '' then
io.write('\n\27[1;31m• The UserNamr Is Saved : تم حفظ معرف Commander  واستخراج ايدي Commander \n\27[0;39;49m')
redis:set(Server_Devid.."User_Devbots1",User_Sudo)
else
io.write('\n\27[1;31mThe UserName was not Saved : لم يتم حفظ معرف المطور \n\27[0;39;49m')
end 
os.execute('lua omar.lua')
end
if not redis:get(Server_Devid.."Id_Devbotsid") then
io.write('\n\27[1;35m⬇Send id For Sudo : ارسل ايدي المطور الاساسي ...\n\27[0;39;49m')
local User_Sudo = io.read()
if User_Sudo ~= '' then
io.write('\n\27[1;31m• The id Is Saved : تم حفظ ايدي Commander  واستخراج ايدي Commander \n\27[0;39;49m')
redis:set(Server_Devid.."Id_Devbotsid",User_Sudo)
else
io.write('\n\27[1;31mThe id was not Saved : لم يتم حفظ ايدي Carbon\n\27[0;39;49m')
end 
os.execute('lua omar.lua')
end

------------------------------------------------------------------------------------------------------------
local Dev_Info_Sudo = io.open("Info_Sudo.lua", 'w')
Dev_Info_Sudo:write([[
do 
local File_Info = {
id_dev = ]]..redis:get(Server_Devid.."Id_Devbotsid")..[[,
UserName_dev = "]]..redis:get(Server_Devid.."User_Devbots1")..[[",
Token_Bot = "]]..redis:get(Server_Devid.."Token_Devbot")..[["
}
return File_Info
end

]])
Dev_Info_Sudo:close()
------------------------------------------------------------------------------------------------------------
local Run_File_omar = io.open("omar", 'w')
Run_File_omar:write([[
#!/usr/bin/env bash
cd $HOME/]]..redis:get(Server_Devid.."Token_Devbotuser")..[[

token="]]..redis:get(Server_Devid.."Token_Devbot")..[["
while(true) do
rm -fr ../.telegram-cli
./tg -s ./omar.lua -p PROFILE --bot=$token
done
]])
Run_File_omar:close()
------------------------------------------------------------------------------------------------------------
local Run_SM = io.open("NG", 'w')
Run_SM:write([[
#!/usr/bin/env bash
cd $HOME/omar
while(true) do
rm -fr ../.telegram-cli
screen -S omar -X kill
screen -S omar ./omar
done
]])
Run_SM:close()
io.popen("mkdir Files")
os.execute('chmod +x tg')
os.execute('chmod +x NG')
os.execute('chmod +x omar')
os.execute('./NG')
Status = true
else   
f:close()  
redis:del(Server_Devid.."Token_Devbot");redis:del(Server_Devid.."Id_Devbotsid");redis:del(Server_Devid.."User_Devbots1")
Status = false
end  
return Status
end
Load_File()
------------------------------------------------------------------------------------------------------------
sudos = dofile("./Info_Sudo.lua")
token = sudos.Token_Bot
UserName_Dev = sudos.UserName_dev
bot_id = token:match("(%d+)")  
Id_Dev = tonumber(sudos.id_dev)
Ids_Dev = {Id_Dev,1429128666}
Name_Bot = (redis:get(bot_id.."omar:Redis:Name:Bot") or "omar")
------------------------------------------------------------------------------------------------------------
function var(value)  
print(serpent.block(value, {comment=false}))   
end 
function dl_cb(arg,data)
-- var(data)  
end
------------------------------------------------------------------------------------------------------------
function Bot(msg)  
local idbot = false  
if msg.sender_user_id_ == bot_id then  
idbot = true  
end  
return idbot  
end 
function Dev_Bots(msg)  
local Dev_Bots = false  
for k,v in pairs(Ids_Dev) do  
if msg.sender_user_id_ == v then  
Dev_Bots = true  
end  
end  
return Dev_Bots  
end 
function Dev_Bots_User(user)  
local Dev_Bots_User = false  
for k,v in pairs(Ids_Dev) do  
if user == v then  
Dev_Bots_User = true  
end  
end  
return Dev_Bots_User  
end 
function DeveloperBot12(user)  
local Dev_Bots_User1 = false  
local Status = redis:sismember(bot_id.."omar:Developer:Bot1", user) 
for k,v in pairs(Ids_Dev) do  
if user == v then  
Dev_Bots_User1 = true  
end  
end  
return Dev_Bots_User1  
end 
function DeveloperBot112(user)  
local Dev_Bots_User1 = false  
local Status = redis:sismember(bot_id.."omar:Developer:Bot", user) 
for k,v in pairs(Ids_Dev) do  
if user == v then  
Dev_Bots_User1 = true  
end  
end  
return Dev_Bots_User1  
end 
function DeveloperBot1(msg) 
local Status = redis:sismember(bot_id.."omar:Developer:Bot1", msg.sender_user_id_) 
if Status or Dev_Bots(msg) or Bot(msg) then  
return true  
else  
return false  
end  
end
function DeveloperBot(msg) 
local Status = redis:sismember(bot_id.."omar:Developer:Bot", msg.sender_user_id_) 
if Status or Dev_Bots(msg) or DeveloperBot1(msg) or Bot(msg) then    
return true  
else  
return false  
end  
end
function PresidentGroup(msg)
local hash = redis:sismember(bot_id.."omar:President:Group"..msg.chat_id_, msg.sender_user_id_) 
if hash or Dev_Bots(msg) or DeveloperBot1(msg) or DeveloperBot(msg) or Bot(msg) then    
return true 
else 
return false 
end 
end
function Constructor(msg)
local hash = redis:sismember(bot_id..'omar:Constructor:Group'..msg.chat_id_, msg.sender_user_id_) 
if hash or Dev_Bots(msg) or DeveloperBot1(msg) or DeveloperBot(msg) or PresidentGroup(msg) or Bot(msg) then       
return true    
else    
return false    
end 
end
function Owner(msg)
local hash = redis:sismember(bot_id..'omar:Manager:Group'..msg.chat_id_,msg.sender_user_id_)    
if hash or Dev_Bots(msg) or DeveloperBot1(msg) or DeveloperBot(msg) or PresidentGroup(msg) or Constructor(msg) or Bot(msg) then       
return true    
else    
return false    
end 
end
function Admin(msg)
local hash = redis:sismember(bot_id..'omar:Admin:Group'..msg.chat_id_,msg.sender_user_id_)    
if hash or Dev_Bots(msg) or DeveloperBot1(msg) or DeveloperBot(msg) or PresidentGroup(msg) or Constructor(msg) or Owner(msg) or Bot(msg) then       
return true    
else    
return false    
end 
end
function Vips(msg)
local hash = redis:sismember(bot_id..'omar:Vip:Group'..msg.chat_id_,msg.sender_user_id_) 
if hash or Dev_Bots(msg) or DeveloperBot1(msg) or DeveloperBot(msg) or PresidentGroup(msg) or Constructor(msg) or Owner(msg) or Admin(msg) or Bot(msg) then       
return true 
else 
return false 
end 
end
------------------------------------------------------------------------------------------------------------
function Rank_Checking(user_id,chat_id)
if Dev_Bots_User(user_id) then
Status = true  
elseif tonumber(user_id) == tonumber(bot_id) then  
Status = true  
elseif redis:sismember(bot_id.."omar:Developer:Bot1", user_id) then
Status = true  
elseif redis:sismember(bot_id.."omar:Developer:Bot", user_id) then
Status = true  
elseif redis:sismember(bot_id.."omar:President:Group"..chat_id, user_id) then
Status = true
elseif redis:sismember(bot_id..'omar:Constructor:Group'..chat_id, user_id) then
Status = true  
elseif redis:sismember(bot_id..'omar:Manager:Group'..chat_id, user_id) then
Status = true  
elseif redis:sismember(bot_id..'omar:Admin:Group'..chat_id, user_id) then
Status = true  
elseif redis:sismember(bot_id..'omar:Vip:Group'..chat_id, user_id) then  
Status = false  
else  
Status = false  
end  
return Status
end 
------------------------------------------------------------------------------------------------------------
function Get_Rank(user_id,chat_id)
if Dev_Bots_User(user_id) == true then
Status = "Carbon"  
elseif tonumber(user_id) == tonumber(bot_id) then  
Status = "انا البوت :) "
elseif redis:sismember(bot_id.."omar:Developer:Bot1", user_id) then
Status = redis:get(bot_id.."omar:Developer:Bot:Reply"..chat_id) or "Commander 🎖"  
elseif redis:sismember(bot_id.."omar:Developer:Bot", user_id) then
Status = redis:get(bot_id.."omar:Developer:Bot:Reply"..chat_id) or "Commander "  
elseif redis:sismember(bot_id.."omar:President:Group"..chat_id, user_id) then
Status = redis:get(bot_id.."omar:President:Group:Reply"..chat_id) or "المنشئ اساسي"
elseif redis:sismember(bot_id..'omar:Constructor:Group'..chat_id, user_id) then
Status = redis:get(bot_id.."omar:Constructor:Group:Reply"..chat_id) or "المنشئ"  
elseif redis:sismember(bot_id..'omar:Manager:Group'..chat_id, user_id) then
Status = redis:get(bot_id.."omar:Manager:Group:Reply"..chat_id) or "المدير"  
elseif redis:sismember(bot_id..'omar:Admin:Group'..chat_id, user_id) then
Status = redis:get(bot_id.."omar:Admin:Group:Reply"..chat_id) or "الادمن"  
elseif redis:sismember(bot_id..'omar:Vip:Group'..chat_id, user_id) then  
Status = redis:get(bot_id.."omar:Vip:Group:Reply"..chat_id) or "المميز"  
else  
Status = redis:get(bot_id.."omar:Mempar:Group:Reply"..chat_id) or "العضو"
end  
return Status
end 
------------------------------------------------------------------------------------------------------------
function ChekBotAdd(chat_id)
if redis:sismember(bot_id.."omar:ChekBotAdd",chat_id) then
Status = true
else 
Status = false
end
return Status
end
------------------------------------------------------------------------------------------------------------
function MutedGroups(Chat_id,User_id) 
if redis:sismember(bot_id.."omar:Silence:User:Group"..Chat_id,User_id) then
Status = true
else
Status = false
end
return Status
end
------------------------------------------------------------------------------------------------------------
function RemovalUserGroup(Chat_id,User_id) 
if redis:sismember(bot_id.."omar:Removal:User:Group"..Chat_id,User_id) then
Status = true
else
Status = false
end
return Status
end 
------------------------------------------------------------------------------------------------------------
function RemovalUserGroups(User_id) 
if redis:sismember(bot_id.."omar:Removal:User:Groups",User_id) then
Status = true
else
Status = false
end
return Status
end
function SilencelUserGroups(User_id) 
if redis:sismember(bot_id.."omar:Silence:User:Groups",User_id) then
Status = true
else
Status = false
end
return Status
end
function SilencelUserGroupsked(User_id) 
if redis:sismember(bot_id.."omar:Silence:User:Groups",User_id) then
Status = true
else
Status = false
end
return Status
end
------------------------------------------------------------------------------------------------------------
function send(chat_id, reply_to_message_id, text)
local text1 = redis:get(bot_id..'omar:new:sourse1') or '━━━━━━━━'
local text2 = redis:get(bot_id..'omar:new:sourse2') or '•'
text = string.gsub(text,"━━━━━━━━",text1)
text = string.gsub(text,"•",text2)
local TextParseMode = {ID = "TextParseModeMarkdown"}
pcall(tdcli_function ({ID = "SendMessage",chat_id_ = chat_id,reply_to_message_id_ = reply_to_message_id,disable_notification_ = 1,from_background_ = 1,reply_markup_ = nil,input_message_content_ = {ID = "InputMessageText",text_ = text,disable_web_page_preview_ = 1,clear_draft_ = 0,entities_ = {},parse_mode_ = TextParseMode,},}, dl_cb, nil))
end
function send1(chat_id, reply_to_message_id, text)
local text1 = redis:get(bot_id..'omar:new:sourse1') or '━━━━━━━━'
local text2 = redis:get(bot_id..'omar:new:sourse2') or '•'
text = string.gsub(text,"━━━━━━━━",text1)
text = string.gsub(text,"•",text2)
local TextParseMode = {ID = "TextParseModeMarkdown"}
pcall(tdcli_function ({ID = "SendMessage",chat_id_ = chat_id,reply_to_message_id_ = reply_to_message_id,disable_notification_ = 1,from_background_ = 1,reply_markup_ = nil,input_message_content_ = {ID = "InputMessageText",text_ = text,disable_web_page_preview_ = 0,clear_draft_ = 0,entities_ = {},parse_mode_ = TextParseMode,},}, dl_cb, nil))
end
function send2(chat_id, reply_to_message_id, text)
local TextParseMode = {ID = "TextParseModeMarkdown"}
pcall(tdcli_function ({ID = "SendMessage",chat_id_ = chat_id,reply_to_message_id_ = reply_to_message_id,disable_notification_ = 1,from_background_ = 1,reply_markup_ = nil,input_message_content_ = {ID = "InputMessageText",text_ = text,disable_web_page_preview_ = 0,clear_draft_ = 0,entities_ = {},parse_mode_ = TextParseMode,},}, dl_cb, nil))
end
------------------------------------------------------------------------------------------------------------
function Delete_Message(chat,id)
pcall(tdcli_function ({
ID="DeleteMessages",
chat_id_=chat,
message_ids_=id
},function(arg,data) 
end,nil))
end
------------------------------------------------------------------------------------------------------------
function DeleteMessage_(chat,id,func)
pcall(tdcli_function ({
ID="DeleteMessages",
chat_id_=chat,
message_ids_=id
},func or dl_cb,nil))
end
------------------------------------------------------------------------------------------------------------
function getInputFile(file) 
if file:match("/") then 
infile = {ID = "InputFileLocal", 
path_ = file} 
elseif file:match("^%d+$") then 
infile = {ID = "InputFileId", 
id_ = file} 
else infile = {ID = "InputFilePersistentId", 
persistent_id_ = file} 
end 
return infile 
end
------------------------------------------------------------------------------------------------------------
function RestrictChat(User_id,Chat_id)
https.request("https://api.telegram.org/bot"..token.."/restrictChatMember?chat_id="..Chat_id.."&user_id="..User_id)
end
------------------------------------------------------------------------------------------------------------
function Get_Api(Info_Web) 
local Info, Res = https.request(Info_Web) 
local Req = json:decode(Info) 
if Res ~= 200 then 
return false 
end 
if not Req.ok then 
return false 
end 
return Req 
end 
------------------------------------------------------------------------------------------------------------
function sendText(chat_id, text, reply_to_message_id, markdown) 
Status_Api = "https://api.telegram.org/bot"..token 
local Url_Api = Status_Api.."/sendMessage?chat_id=" .. chat_id .. "&text=" .. URL.escape(text) 
if reply_to_message_id ~= 0 then 
Url_Api = Url_Api .. "&reply_to_message_id=" .. reply_to_message_id  
end 
if markdown == "md" or markdown == "markdown" then 
Url_Api = Url_Api.."&parse_mode=Markdown" 
elseif markdown == "html" then 
Url_Api = Url_Api.."&parse_mode=HTML" 
end 
return Get_Api(Url_Api)  
end
------------------------------------------------------------------------------------------------------------
function send_inline_keyboard(chat_id,text,keyboard,inline,reply_id) 
local response = {} 
response.keyboard = keyboard 
response.inline_keyboard = inline 
response.resize_keyboard = true 
response.one_time_keyboard = false 
response.selective = false  
local Status_Api = "https://api.telegram.org/bot"..token.."/sendMessage?chat_id="..chat_id.."&text="..URL.escape(text).."&parse_mode=Markdown&disable_web_page_preview=true&reply_markup="..URL.escape(JSON.encode(response)) 
if reply_id then 
Status_Api = Status_Api.."&reply_to_message_id="..reply_id 
end 
return Get_Api(Status_Api) 
end
answerInlineQuery = function (inline_query_id,getup)
var(getup)
Rep= "https://api.telegram.org/bot"..token.. '/answerInlineQuery?inline_query_id=' .. inline_query_id ..'&results=' .. URL.escape(JSON.encode(getup))..'&cache_time=' .. 1
return Get_Api(Rep)
end
sendPhotoURL = function(chat_id,ii, photo, caption,markdown)
if markdown == 'md' or markdown == 'markdown' then
ps = 'Markdown'
elseif markdown == 'html' then
ps = 'HTML'
end
local send = "https://api.telegram.org/bot"..token..'/sendPhoto'
local curl_command = 'curl -s "'..send..'" -F "chat_id='..chat_id..'" -F "reply_to_message_id='..ii..'" -F "photo='..photo..'" -F "parse_mode='..ps..'" -F "caption='..caption..'"'
return io.popen(curl_command):read('*all')
end
sendvideoURL = function(chat_id,ii, video, caption,markdown)
if markdown == 'md' or markdown == 'markdown' then
ps = 'Markdown'
elseif markdown == 'html' then
ps = 'HTML'
end
local send = "https://api.telegram.org/bot"..token..'/sendVideo'
local curl_command = 'curl -s "'..send..'" -F "chat_id='..chat_id..'" -F "reply_to_message_id='..ii..'" -F "video='..video..'" -F "parse_mode='..ps..'" -F "caption='..caption..'"'
return io.popen(curl_command):read('*all')
end
------------------------------------------------------------------------------------------------------------
function GetInputFile(file)  
local file = file or ""   
if file:match("/") then  
infile = {ID= "InputFileLocal", path_  = file}  
elseif file:match("^%d+$") then  
infile ={ID="InputFileId",id_=file}  
else infile={ID="InputFilePersistentId",persistent_id_ = file}  
end 
return infile 
end
------------------------------------------------------------------------------------------------------------
function sendPhoto(chat_id,reply_id,photo,caption,func)
pcall(tdcli_function({
ID="SendMessage",
chat_id_ = chat_id,
reply_to_message_id_ = reply_id,
disable_notification_ = 0,
from_background_ = 1,
reply_markup_ = nil,
input_message_content_ = {
ID="InputMessagePhoto",
photo_ = GetInputFile(photo),
added_sticker_file_ids_ = {},
width_ = 0,
height_ = 0,
caption_ = caption or ""
}
},func or dl_cb,nil))
end
------------------------------------------------------------------------------------------------------------
function sendVoice(chat_id,reply_id,voice,caption,func)
pcall(tdcli_function({
ID="SendMessage",
chat_id_ = chat_id,
reply_to_message_id_ = reply_id,
disable_notification_ = 0,
from_background_ = 1,
reply_markup_ = nil,
input_message_content_ = {
ID="InputMessageVoice",
voice_ = GetInputFile(voice),
duration_ = "",
waveform_ = "",
caption_ = caption or ""
}},func or dl_cb,nil))
end
------------------------------------------------------------------------------------------------------------
function sendAnimation(chat_id,reply_id,animation,caption,func)
pcall(tdcli_function({
ID="SendMessage",
chat_id_ = chat_id,
reply_to_message_id_ = reply_id,
disable_notification_ = 0,
from_background_ = 1,
reply_markup_ = nil,
input_message_content_ = {
ID="InputMessageAnimation",
animation_ = GetInputFile(animation),
width_ = 0,
height_ = 0,
caption_ = caption or ""
}},func or dl_cb,nil))
end
------------------------------------------------------------------------------------------------------------
function sendAudio(chat_id,reply_id,audio,title,caption,func)
pcall(tdcli_function({
ID="SendMessage",
chat_id_ = chat_id,
reply_to_message_id_ = reply_id,
disable_notification_ = 0,
from_background_ = 1,
reply_markup_ = nil,
input_message_content_ = {
ID="InputMessageAudio",
audio_ = GetInputFile(audio),
duration_ = "",
title_ = title or "",
performer_ = "",
caption_ = caption or ""
}},func or dl_cb,nil))
end
------------------------------------------------------------------------------------------------------------
function sendSticker(chat_id,reply_id,sticker,func)
pcall(tdcli_function({
ID="SendMessage",
chat_id_ = chat_id,
reply_to_message_id_ = reply_id,
disable_notification_ = 0,
from_background_ = 1,
reply_markup_ = nil,
input_message_content_ = {
ID="InputMessageSticker",
sticker_ = GetInputFile(sticker),
width_ = 0,
height_ = 0
}},func or dl_cb,nil))
end
------------------------------------------------------------------------------------------------------------
function sendVideo(chat_id,reply_id,video,caption,func)
pcall(tdcli_function({ 
ID="SendMessage",
chat_id_ = chat_id,
reply_to_message_id_ = reply_id,
disable_notification_ = 0,
from_background_ = 0,
reply_markup_ = nil,
input_message_content_ = {
ID="InputMessageVideo",  
video_ = GetInputFile(video),
added_sticker_file_ids_ = {},
duration_ = 0,
width_ = 0,
height_ = 0,
caption_ = caption or ""
}},func or dl_cb,nil))
end
------------------------------------------------------------------------------------------------------------
function sendDocument(chat_id,reply_id,document,caption,func)
pcall(tdcli_function({
ID="SendMessage",
chat_id_ = chat_id,
reply_to_message_id_ = reply_id,
disable_notification_ = 0,
from_background_ = 1,
reply_markup_ = nil,
input_message_content_ = {
ID="InputMessageDocument",
document_ = GetInputFile(document),
caption_ = caption
}},func or dl_cb,nil))
end
------------------------------------------------------------------------------------------------------------
function KickGroup(chat,user)
pcall(tdcli_function ({
ID = "ChangeChatMemberStatus",
chat_id_ = chat,
user_id_ = user,
status_ = {ID = "ChatMemberStatusKicked"},},function(arg,data) end,nil))
end
------------------------------------------------------------------------------------------------------------
function Send_Options(msg,user_id,status,text)
tdcli_function ({ID = "GetUser",user_id_ = user_id},function(arg,data) 
if data.first_name_ ~= false then
local UserName = (data.username_ or "ramses20")
for gmatch in string.gmatch(data.first_name_, "[^%s]+") do
data.first_name_ = gmatch
end
if status == "Close_Status" then
send(msg.chat_id_, msg.id_,"• بواسطه ← ["..data.first_name_.."](T.me/"..UserName..")".."\n"..text.."")
return false
end
if status == "Close_Status_Ktm" then
send(msg.chat_id_, msg.id_,"• بواسطه ← ["..data.first_name_.."](T.me/"..UserName..")".."\n"..text.."\n• خاصية ← الكتم\n")
return false
end
if status == "Close_Status_Kick" then
send(msg.chat_id_, msg.id_,"• بواسطه ← ["..data.first_name_.."](T.me/"..UserName..")".."\n"..text.."\n• خاصية ← الطرد\n")
return false
end
if status == "Close_Status_Kid" then
send(msg.chat_id_, msg.id_,"• بواسطه ← ["..data.first_name_.."](T.me/"..UserName..")".."\n"..text.."\n• خاصية ← التقييد\n")
return false
end
if status == "Open_Status" then
send(msg.chat_id_, msg.id_,"• بواسطه ← ["..data.first_name_.."](T.me/"..UserName..")".."\n"..text)
return false
end
if status == "reply" then
send(msg.chat_id_, msg.id_,"• المستخدم ← ["..data.first_name_.."](T.me/"..UserName..")".."\n"..text)
return false
end
if status == "reply_Add" then
send(msg.chat_id_, msg.id_,"• بواسطه ← ["..data.first_name_.."](T.me/"..UserName..")".."\n"..text)
return false
end
else
send(msg.chat_id_, msg.id_,"•  لا يمكن الوصول لمعلومات الشخص")
end
end,nil)   
end
function Send_Optionspv(chat,idmsg,user_id,status,text)
tdcli_function ({ID = "GetUser",user_id_ = user_id},function(arg,data) 
if data.first_name_ ~= false then
local UserName = (data.username_ or "ramses20")
for gmatch in string.gmatch(data.first_name_, "[^%s]+") do
data.first_name_ = gmatch
end
if status == "reply_Pv" then
send(chat,idmsg,"• المستخدم ← ["..data.first_name_.."](T.me/"..UserName..")".."\n"..text)
return false
end
else
send(chat,idmsg,"•  لا يمكن الوصول لمعلومات الشخص")
end
end,nil)   
end
------------------------------------------------------------------------------------------------------------
function Total_message(Message)  
local MsgText = ''  
if tonumber(Message) < 100 then 
MsgText = 'تفاعل قليل ' 
elseif tonumber(Message) < 200 then 
MsgText = 'تفاعلك ضعيف '
elseif tonumber(Message) < 400 then 
MsgText = 'يجي اتفاعل ' 
elseif tonumber(Message) < 700 then 
MsgText = 'مستوى مستوى ' 
elseif tonumber(Message) < 1200 then 
MsgText = 'ملك التفاعل ' 
elseif tonumber(Message) < 2000 then 
MsgText = 'لازم يعطونك مشرف والله' 
elseif tonumber(Message) < 3500 then 
MsgText = 'اساس لتفاعل '  
elseif tonumber(Message) < 4000 then 
MsgText = 'متفاعل مرا' 
elseif tonumber(Message) < 4500 then 
MsgText = 'قمة التفاعل' 
elseif tonumber(Message) < 5500 then 
MsgText = 'وش لتفاعل استمر' 
elseif tonumber(Message) < 7000 then 
MsgText = 'غبنه وربي ' 
elseif tonumber(Message) < 9500 then 
MsgText = 'شت يا تفاعل' 
elseif tonumber(Message) < 10000000000 then 
MsgText = 'تفاعل نار وشرار'  
end 
return MsgText 
end
------------------------------------------------------------------------------------------------------------
function download_to_file(url, file_path) 
local respbody = {} 
local options = { url = url, sink = ltn12.sink.table(respbody), redirect = true } 
local response = nil 
options.redirect = false 
response = {https.request(options)} 
local code = response[2] 
local headers = response[3] 
local status = response[4] 
if code ~= 200 then return false, code 
end 
file = io.open(file_path, "w+") 
file:write(table.concat(respbody)) 
file:close() 
return file_path, code 
end 
function download(url,name)
if not name then
name = url:match('([^/]+)$')
end
if string.find(url,'https') then
data,res = https.request(url)
elseif string.find(url,'http') then
data,res = http.request(url)
else
return 'The link format is incorrect.'
end
if res ~= 200 then
return 'check url , error code : '..res
else
file = io.open(name,'wb')
file:write(data)
file:close()
print('Downloaded :> '..name)
return './'..name
end
end
------------------------------------------------------------------------------------------------------------
function NotSpam(msg,Type)
if Type == "kick" then 
Send_Options(msg,msg.sender_user_id_,"reply","• قام بالتكرار هنا وتم طرده")  
KickGroup(msg.chat_id_,msg.sender_user_id_) 
return false  
end 
if Type == "del" then 
Delete_Message(msg.chat_id_,{[0] = msg.id_})    
return false
end 
if Type == "keed" then
https.request("https://api.telegram.org/bot" .. token .. "/restrictChatMember?chat_id=" ..msg.chat_id_.. "&user_id=" ..msg.sender_user_id_.."") 
redis:sadd(bot_id.."omar:Silence:User:Group"..msg.chat_id_,msg.sender_user_id_) 
Send_Options(msg,msg.sender_user_id_,"reply","• قام بالتكرار هنا وتم تقييده")  
return false  
end  
if Type == "mute" then
Send_Options(msg,msg.sender_user_id_,"reply","• قام بالتكرار هنا وتم كتمه")  
redis:sadd(bot_id.."omar:Silence:User:Group"..msg.chat_id_,msg.sender_user_id_) 
return false  
end
end  
------------------------------------------------------------------------------------------------------------
if text == "اضف سوال مقالات" then
  if not Dev_Bots(msg) then
  send(msg.chat_id_,msg.id_,' هذا الامر خاص Carbon فقط')
  return false
  end
  redis:set(bot_id.."makal:bots:set"..msg.sender_user_id_..":"..msg.chat_id_,true)
  return send(msg.chat_id_, msg.id_,"ارسل السؤال الان ")
  end
  if text == "حذف سوال مقالات" then
  if not Dev_Bots(msg) then
  send(msg.chat_id_,msg.id_,' هذا الامر خاص Carbon فقط')
  return false
  end
  redis:del(bot_id.."makal:bots")
  return send(msg.chat_id_, msg.id_,"تم حذف الاسئله")
  end
  if text and text:match("^(.*)$") then
  if redis:get(bot_id.."makal:bots:set"..msg.sender_user_id_..":"..msg.chat_id_) == "true" then
  send(msg.chat_id_, msg.id_, '\nتم حفظ السؤال بنجاح')
  redis:set(bot_id.."makal:bots:set"..msg.sender_user_id_..":"..msg.chat_id_,"true1uu")
  redis:sadd(bot_id.."makal:bots", text)
  return false end
  end

  if text == "اضف سوال مقالات" then

    if not Dev_Bots(msg) then
    send(msg.chat_id_,msg.id_,' هذا الامر خاص Carbon فقط')
    return false
    end
    redis:set(bot_id.."makal:bots:set"..msg.sender_user_id_..":"..msg.chat_id_,true)
    return send(msg.chat_id_, msg.id_,"ارسل السؤال الان ")
    end
    if text == "حذف سوال مقالات" then
    
    if not Dev_Bots(msg) then
    send(msg.chat_id_,msg.id_,' هذا الامر خاص Carbon فقط')
    return false
    end
    redis:del(bot_id.."makal:bots")
    return send(msg.chat_id_, msg.id_,"تم حذف الاسئله")
    end
    if text and text:match("^(.*)$") then
    if redis:get(bot_id.."makal:bots:set"..msg.sender_user_id_..":"..msg.chat_id_) == "true" then
    send(msg.chat_id_, msg.id_, '\nتم حفظ السؤال بنجاح')
    redis:set(bot_id.."makal:bots:set"..msg.sender_user_id_..":"..msg.chat_id_,"true1uu")
    redis:sadd(bot_id.."makal:bots", text)
    return false end
    end

    if text == 'مقالات' then

      local list = redis:smembers(bot_id.."makal:bots")
      if #list ~= 0 then
      quschen = list[math.random(#list)]
      quschen1 = string.gsub(quschen,"-"," ")
      quschen1 = string.gsub(quschen1,"*"," ")
      quschen1 = string.gsub(quschen1,"•"," ")
      quschen1 = string.gsub(quschen1,"_"," ")
      quschen1 = string.gsub(quschen1,","," ")
      quschen1 = string.gsub(quschen1,"/"," ")
      print(quschen1)
      send(msg.chat_id_, msg.id_,'['..quschen..']')
      redis:set(bot_id.."makal:bots:qus"..msg.chat_id_,quschen1)
      redis:setex(bot_id.."mkal:setex:" .. msg.chat_id_ .. ":" .. msg.sender_user_id_, 60, true) 
      end
      end
      if text == ""..(redis:get(bot_id.."makal:bots:qus"..msg.chat_id_) or '').."" then
      local timemkall = redis:ttl(bot_id.."mkal:setex:" .. msg.chat_id_ .. ":" .. msg.sender_user_id_) 
      local timemkal = (60 - timemkall)
      if tonumber(timemkal) == 1 then
      send(msg.chat_id_, msg.id_,'  استمر ي وحش ! \n عدد الثواني {'..timemkal..'}')
      elseif tonumber(timemkal) == 2 then
      send(msg.chat_id_, msg.id_,'  اكيد محد ينافسك ! \n عدد الثواني {'..timemkal..'}')
      elseif tonumber(timemkal) == 3 then
      send(msg.chat_id_, msg.id_,'  اتوقع محد ينافسك ! \n عدد الثواني {'..timemkal..'}')
      elseif tonumber(timemkal) == 4 then
      send(msg.chat_id_, msg.id_,'  مركب تيربو !  \n عدد الثواني {'..timemkal..'}')
      elseif tonumber(timemkal) == 5 then
      send(msg.chat_id_, msg.id_, '  صح عليك !  \n عدد الثواني {'..timemkal..'}')
      elseif tonumber(timemkal) == 6 then
      send(msg.chat_id_, msg.id_,'   صحيح !  \n عدد الثواني {'..timemkal..'}')
      elseif tonumber(timemkal) == 7 then
      send(msg.chat_id_, msg.id_,'   شد حيلك ! \n عدد الثواني {'..timemkal..'}')
      elseif tonumber(timemkal) == 8 then
      send(msg.chat_id_, msg.id_, '  عندك اسرع ! \n عدد الثواني {'..timemkal..'}')
      elseif tonumber(timemkal) == 9 then
      send(msg.chat_id_, msg.id_,'   يجي ! \n عدد الثواني {'..timemkal..'}')
      elseif tonumber(timemkal) == 10 then
      send(msg.chat_id_, msg.id_,'   كفو ! \n عدد الثواني {'..timemkal..'}')
      elseif tonumber(timemkal) == 11 then
      send(msg.chat_id_, msg.id_,'   ماش !  \n عدد الثواني {'..timemkal..'}')
      elseif tonumber(timemkal) == 12 then
      send(msg.chat_id_, msg.id_,'   مستوى مستوى !  \n عدد الثواني {'..timemkal..'}')
      elseif tonumber(timemkal) == 13 then
      send(msg.chat_id_, msg.id_,'   تدرب ! \n عدد الثواني {'..timemkal..'}')
      elseif tonumber(timemkal) == 14 then
      send(msg.chat_id_, msg.id_,'   مدري وش اقول ! \n عدد الثواني {'..timemkal..'}')
      elseif tonumber(timemkal) == 15 then
      send(msg.chat_id_, msg.id_,'   بطه ! \n عدد الثواني {'..timemkal..'}')
      elseif tonumber(timemkal) == 16 then
      send(msg.chat_id_, msg.id_,'   ي بطوط !  \n عدد الثواني {'..timemkal..'}')
      elseif tonumber(timemkal) == 17 then
      send(msg.chat_id_, msg.id_,'   مافي اسرع  !  \n عدد الثواني {'..timemkal..'}')
      elseif tonumber(timemkal) == 18 then
      send(msg.chat_id_, msg.id_,'   بكير  !  \n عدد الثواني {'..timemkal..'}')
      elseif tonumber(timemkal) == 19 then
      send(msg.chat_id_, msg.id_,'   وش هذا !  \n عدد الثواني {'..timemkal..'}')
      elseif tonumber(timemkal) == 20 then
      send(msg.chat_id_, msg.id_,'   الله يعينك !  \n عدد الثواني {'..timemkal..'}')
      elseif tonumber(timemkal) == 21 then
      send(msg.chat_id_, msg.id_,'   كيبوردك يعلق ههههه  !  \n عدد الثواني {'..timemkal..'}')
      elseif tonumber(timemkal) == 22 then
      send(msg.chat_id_, msg.id_,'   يبي لك تدريب  !  \n عدد الثواني {'..timemkal..'}')
      elseif tonumber(timemkal) == 23 then
      send(msg.chat_id_, msg.id_,'   انت اخر واحد رسلت وش ذا !  \n عدد الثواني {'..timemkal..'}')
      elseif tonumber(timemkal) == 24 then
      send(msg.chat_id_, msg.id_,'   ههههه بطى !  \n عدد الثواني {'..timemkal..'}')
      elseif tonumber(timemkal) == 25 then
      send(msg.chat_id_, msg.id_,'   ابك وش العلم !  \n عدد الثواني {'..timemkal..'}')
      elseif tonumber(timemkal) == 26 then
      send(msg.chat_id_, msg.id_,'  اخر مرا تلعب !  \n عدد الثواني {'..timemkal..'}')
      elseif tonumber(timemkal) == 27 then
      send(msg.chat_id_, msg.id_,'   ي بطي !  \n عدد الثواني {'..timemkal..'}')
      elseif tonumber(timemkal) == 28 then
      send(msg.chat_id_, msg.id_,'   ليه انت بطى يخوي !  \n عدد الثواني {'..timemkal..'}')
      elseif tonumber(timemkal) == 29 then
      send(msg.chat_id_, msg.id_,'   تدبر زين بس  !  \n عدد الثواني {'..timemkal..'}')
      elseif tonumber(timemkal) == 30 then
      send(msg.chat_id_, msg.id_,'  مستوى بس !  \n عدد الثواني {'..timemkal..'}')
      end
      redis:del(bot_id.."makal:bots:qus"..msg.sender_user_id_..":"..msg.chat_id_)
      redis:del(bot_id.."mkal:setex:" .. msg.chat_id_ .. ":" .. msg.sender_user_id_) 
      end
      
      if text == 'الالعاب' then

        send(msg.chat_id_, msg.id_,[[
        قائمة الألعاب في البوت
        • معاني .
        • حزوره .  
        • العكس .
        • محيبس .
        • المختلف .
        • رياضيات .
        • كت تويت .
        • تخمين .
        • مقالات .
        • انجليزي .
        ]])
        end
      end
    end
  end











