
//在jsp页面引用js文件时候,jsp页面本身必须是UTF-8编码,而且引用的时候也要是UTF-8或者gb2312编码格式
//在上面的方法正确时,编码还有可能出现乱码情况,因为js本身保存的格式不一定是gb2312或者UTF-8,这时候一定要改成这两种格式
//在js中//等同于"";test等同于matches,在js中没有trim()这个函数,再比较连个字符串是否相同时用==
function formcheck(){
UsernameStr=document.form_1.userName.value.toString();
PasswordStr=document.form_1.password.value.toString();
RepetitionPasswordStr=document.form_1.repetitionPassword.value.toString();
var re_Username=/[0-9]{5,12}/;
var re_Password=/[A-Za-z0-9]{10,16}/;
if (UsernameStr!=""&&PasswordStr!=""&&RepetitionPasswordStr!="")
{
	if(re_Username.test(UsernameStr))
	{
		if(re_Password.test(PasswordStr)&&re_Password.test(RepetitionPasswordStr))
		{
			if(PasswordStr==RepetitionPasswordStr)
			{
				return true;
			}
			else
			{
				alert("密码不一致!");
				return false;
			}
		}
		else
		{
			alert("只能输入由数字和26个英文字母组成10到16位的密码");
			return false;
		}
	}
	else
	{
		alert("只能输入由数字组成的5到12位用户名");
		return false;
	}
}
else if(UsernameStr=="")
{
	alert("用户名不能为空!");
	return false;
}
else
{
	if(PasswordStr=="")
	{
		alert("密码不能为空!");
		return false;
	}
	else
	{
		alert("重复密码不能为空!");
		return false;
	}
}
}
