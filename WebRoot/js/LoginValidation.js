
//在jsp页面引用js文件时候,jsp页面本身必须是UTF-8编码,而且引用的时候也要是UTF-8或者gb2312编码格式
//在上面的方法正确时,编码还有可能出现乱码情况,因为js本身保存的格式不一定是gb2312或者UTF-8,这时候一定要改成这两种格式
function formcheck(){
UsernameStr=document.form_1.userName.value.toString();
PasswordStr=document.form_1.password.value.toString();
VerificationCodeStr=document.form_1.verificationCode.value.toString();
var re_Username=/[0-9]{5,12}/;
var re_Password=/[A-Za-z0-9]{10,16}/;
var re_VerificationCode=/[A-Za-z0-9]{4,4}/;
if (UsernameStr!=""&&PasswordStr!="")
{
	if(!re_Username.test(UsernameStr))
	{
		alert(randomCode_1);
		return false;
	}
	else
	{
		if(re_Password.test(PasswordStr))
		{	
			if(re_VerificationCode.test(VerificationCodeStr))
			{
				
				if(random_randomCode==VerificationCodeStr)
				{
					return true;
				}
				else
				{
					alert(random_randomCode);
					return false;
				}
			}
			else
			{
				alert("没有输入验证码");
				return false;
			}
		}
		else
		{
			alert("只能输入由数字和26个英文字母组成10到16位的密码");
			return false;
		}
	}
}
else if(UsernameStr=="")
{
	alert("用户名不能为空!");
	return false;
}
else
{
	alert("密码不能为空!");
	return false;
}
}


