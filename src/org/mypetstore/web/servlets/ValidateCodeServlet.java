package org.mypetstore.web.servlets;

import javax.imageio.ImageIO;
import javax.servlet.Servlet;
import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.awt.*;
import java.awt.image.BufferedImage;
import java.io.IOException;
import java.util.Random;

public class ValidateCodeServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    //验证码图片的宽度
     private int width=80;
    //验证码图片的高度
     private int height=30;
     //验证码字符个数
     private int codeCount=4;
     private int x=0;
     //字体高度
     private int fontHeight;
     private int codeY;
     char[] codeSequence = { 'A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J',
             'K', 'L', 'M', 'N', 'O', 'P', 'Q', 'R', 'S', 'T', 'U', 'V', 'W',
             'X', 'Y', 'Z', '0', '1', '2', '3', '4', '5', '6', '7', '8', '9' };
      /**
      * 初始化验证图片属性
      */
      public void init() throws ServletException{
          //从web.XML中获取初始信息
          String strWidth = this.getInitParameter("width");//宽度
          String strHeight = this.getInitParameter("height");//高度
          String strCodeCount = this.getInitParameter("codeCount");//字符数量

          try{
              if(strWidth!=null && strWidth.length()!=0){
                  width = Integer.parseInt(strWidth);
              }
              if(strHeight!=null && strHeight.length()!=0){
                  height = Integer.parseInt(strHeight);
              }
              if(strCodeCount!=null && strCodeCount.length()!=0){
                  codeCount = Integer.parseInt(strCodeCount);
              }
          }catch (NumberFormatException e){
              e.printStackTrace();
          }

          x = width/(codeCount+1);
          fontHeight = height-2;
          codeY = height-4;
      }

      protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
          //定义图像buffer
          BufferedImage buffImg = new BufferedImage(width,height,BufferedImage.TYPE_INT_RGB);
          Graphics2D g = buffImg.createGraphics();
          //创建一个随机数生成类
          Random random = new Random();
          //将图像填充为白色
          g.setColor(Color.WHITE);
          g.fillRect(0,0,width,height);
          //创建字体，字体的大小应该根据图片的高度来定
          Font font = new Font("Fixedsys",Font.PLAIN,fontHeight);
          //设置字体
          g.setFont(font);
          //画边框
          g.setColor(Color.BLACK);
          g.drawRect(0,0,width-1,height);
          //随机产生50条干扰线，使图像中的认证码不易被其他程序探测到
          g.setColor(Color.BLACK);
          for(int i=0;i<50;i++){
              int x = random.nextInt(width);
              int y = random.nextInt(height);
              int xl = random.nextInt(12);
              int yl = random.nextInt(12);
              g.drawLine(x,y,x+xl,y+yl);
          }
          //randomCode用于保存随机产生的验证码，以便进行验证
          StringBuffer randomCode = new StringBuffer();
          int red = 0,green=0,blue=0;
          //随机产生codeCount数字的验证码
          for(int i=0;i<codeCount;i++){
              //得到随机产生的验证码数字
              String strRand = String.valueOf(codeSequence[random.nextInt(36)]);
              //产生随机的颜色分量来构造颜色值
              red = random.nextInt(255);
              green = random.nextInt(255);
              blue = random.nextInt(255);
              //用随机产生的颜色将验证码绘制到图像中
              g.setColor(new Color(red,green,blue));
              g.drawString(strRand,(i+1)*x,codeY);
              //将随机产生的四个数组合在一起
              randomCode.append(strRand);
          }
          //将四位数的验证码保存到Session中
          HttpSession session = request.getSession();
          session.setAttribute("validateCode",randomCode.toString());
          //禁止图像缓存
          response.setHeader("Pragma","no-cache");
          response.setHeader("Cache-Control","no-cache");
          response.setDateHeader("EXPires",0);
          response.setContentType("image/jpeg");
          //将图像输出到Servlet输出流中
          ServletOutputStream servletOutputStream = response.getOutputStream();
          ImageIO.write(buffImg,"jpeg",servletOutputStream);
          servletOutputStream.close();
      }
}
