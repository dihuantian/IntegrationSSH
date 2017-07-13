package com.Integration.Instrument;

import java.awt.Color;
import java.awt.Font;
import java.awt.Graphics;
import java.awt.image.BufferedImage;
import java.util.Map;
import java.util.Random;
import javax.servlet.http.HttpServletResponse;
import org.apache.struts2.interceptor.ServletResponseAware;
import org.apache.struts2.interceptor.SessionAware;
import com.opensymphony.xwork2.ActionSupport;
import com.sun.image.codec.jpeg.JPEGCodec;
import com.sun.image.codec.jpeg.JPEGImageEncoder;

public class TestAction extends ActionSupport implements SessionAware,ServletResponseAware
{
    private Map<String, Object> session;
    private HttpServletResponse response;
    private static final long serialVersionUID = 1L;
    private String chknumber="";
    private char[] codeSequence = { 'A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J',     
            'K', 'L', 'M', 'N', 'O', 'P', 'Q', 'R', 'S', 'T', 'U', 'V', 'W',     
            'X', 'Y', 'Z', '0', '1', '2', '3', '4', '5', '6', '7', '8', '9' };  
    @Override
    public String execute() throws Exception
    {
        response.setHeader("Cache-Control", "no-cache");
        int width=80; //图片宽度
        int height=30; //图片高度
        
        BufferedImage image=new BufferedImage(width,height,BufferedImage.TYPE_INT_RGB);
        Graphics graphics=image.createGraphics();
        
        graphics.setColor(this.getColor());   //背景颜色
        graphics.fillRect(0, 0, width, height);
        Random random=new Random();
  
        for(int i=0;i<100;i++)
        {
        	Color color=getColor();
        	graphics.setColor(color);
            int x = random.nextInt(width);     
            int y = random.nextInt(height);     
            int xl = random.nextInt(12);     
            int yl = random.nextInt(12);     
            graphics.drawLine(x, y, x + xl, y + yl); 
        }
        
        graphics.setFont(new Font("Arial",Font.BOLD,20));
        graphics.setColor(this.getColor());   //字的颜色
        StringBuffer strBuffer=new StringBuffer();
        for(int i=0;i<4;i++)
        {
        	String number=String.valueOf(codeSequence[random.nextInt(36)]);   //生成四位随机数
            // 产生随机的颜色分量来构造颜色值，这样输出的每位数字的颜色值都将不同。     
            int red =  random.nextInt(255);    
            int green = random.nextInt(255);     
            int blue = random.nextInt(255);     
            // 用随机产生的颜色将验证码绘制到图像中。     
            graphics.setColor(new Color(red,green,blue));     
            graphics.drawString(number, i*22, 25);           
            chknumber+=number.toString();
        } 
        session.put("RandomCode", chknumber);     //写入session中
        graphics.dispose();
        System.out.println(chknumber);
        JPEGImageEncoder encoder=JPEGCodec.createJPEGEncoder(response.getOutputStream());
        encoder.encode(image);
        
        response.getOutputStream().flush();    //刷新到页面生成图片
        response.getOutputStream().close();    //关闭writer
        return null;
    }
    private Color getColor(){
    	Random random=new Random();
        int red=random.nextInt(255);
        int green=random.nextInt(255);
        int blue=random.nextInt(255);
        return new Color(red,green,blue);
     }
    public String getChknumber()
    {
        return chknumber;
    }
    public void setChknumber(String chknumber)
    {
        this.chknumber = chknumber;
    }
    @Override
    public void setSession(Map<String, Object> session)
    {
        // TODO Auto-generated method stub
        this.session = session;
    }
    @Override
    public void setServletResponse(HttpServletResponse response)
    {
        // TODO Auto-generated method stub
        this.response = response;
    }
    
}