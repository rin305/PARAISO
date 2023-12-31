package action;

import java.io.PrintWriter;
import java.util.Properties;

import javax.mail.Address;
import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import util.Gmail;
import util.SHA256;
import model.MemberDAO;
import model.Helper;

public class EmailSendPwAction implements CommandAction {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		// TODO Auto-generated method stub
		MemberDAO memdao=new MemberDAO();
		
		String mem_id = request.getParameter("mem_id");
		String mem_email = request.getParameter("mem_email");
		String mem_name=new String(request.getParameter("mem_name").getBytes("ISO-8859-1"), "UTF-8");
		
		Helper help=new Helper();
		String id=help.getProtectedId(mem_id);//보안을 위해 아이디 앞의 세자리만 출력
		System.out.println("EmailSendPwAction의 변경된 id값 출력=>"+id);
		
		System.out.println("EmailSendPwAction의 mem_email값=>"+mem_email);//넘어온 이메일값
		System.out.println("EmailSendPwAction의 mem_id값=>"+mem_id);
		System.out.println("EmailSendPwAction의 mem_name값=>"+mem_name);
		
		int check=memdao.findPassword(mem_id, mem_name, mem_email);
		System.out.println("check=>"+check);
		
		if(check==1) {
		String mem_pw=memdao.changeImsiPassword(mem_id);
		request.setCharacterEncoding("UTF-8");
		String host = "http://localhost:8090/ParaisoResort/";
		String from = "almostparaiso@gmail.com";
		String to = mem_email;
		
		String subject = "[PARAISO] "+mem_name+"님의 임시비밀번호입니다."; 
		String content="<body>\r\n"
				+ "	<table width=\"700px\" style=\"margin-left:auto; margin-right:auto;\">\r\n"
				+ "	<tr><td colspan=\"2\" style=\"padding-bottom:10px;\">\r\n"
				+ "	<img src="+host+"image/admin_logo2.png\" width=\"230px\" height=\"40px\">		\r\n"
				+ "	</td></tr>\r\n"
				+ "	</table>\r\n"
				+ "	<table width=\"700px\" style=\"margin-left:auto; margin-right:auto; padding:5px; border-top:5px solid #665C00; \r\n"
				+ "	border-left:1px solid #EAEAEA; border-right:1px solid #EAEAEA; border-bottom:1px solid #EAEAEA;\">\r\n"
				+ "			<tr>\r\n"
				+ "				<td colspan=\"2\" style=\"font-family:NanumGothic ExtraBold; padding:30px 20px;\">\r\n"
				+ "					<h1><font color=\"#665C00\">비밀번호가 변경</font>되었습니다.</h1>\r\n"
				+ "				</td>\r\n"
				+ "			</tr>\r\n"
				+ "			<tr style=\"font-size:11pt; color:#5D5D5D;\">\r\n"
				+ "				<td colspan=\"2\" style=\"font-family:NanumGothic; padding-left:20px; padding-top:30px;\">안녕하세요. PARAISO 리조트입니다.\r\n"
				+ "				</td>\r\n"
				+ "			</tr>\r\n"
				+ "			<tr style=\"font-size:11pt; color:#5D5D5D;\">\r\n"
				+ "				<td colspan=\"2\" style=\"font-family:NanumGothic; padding:20px 20px;\">"+mem_name+"님의 요청에 따라 비밀번호가 변경되었습니다.<br><br><hr>\r\n"
				+ "				</td>\r\n"
				+ "			</tr>\r\n"
				+ "			<tr style=\"font-size:11pt; color:#5D5D5D; font-family:NanumGothic;\">\r\n"
				+ "				<td width=\"10%\" style=\"color:#8C8C8C; padding-left:20px; padding-top:20px; padding-right:0\">아이디</td>\r\n"
				+ "				<td style=\"padding-left:50px;padding-top:20px; \">"+id+"</td>\r\n"
				+ "			</tr>\r\n"
				+ "			<tr style=\"font-size:11pt; color:#5D5D5D; font-family:NanumGothic;\">\r\n"
				+ "				<td style=\"color:#8C8C8C;  padding-left:20px; padding-top:20px; padding-right:0\">비밀번호</td>\r\n"
				+ "				<td style=\"padding-left:50px;padding-top:20px; \">"+mem_pw+"</td>\r\n"
				+ "			</tr>\r\n"
				+ "			<tr>\r\n"
				+ "				<td colspan=\"2\" style=\"padding:15px 20px; color:red; font-family:NanumGothic Bold; font-size:10pt\">\r\n"
				+ "					임시 비밀번호는 보안에 취약하오니, 로그인 즉시 비밀번호를 변경하시길 권고합니다.\r\n"
				+ "				</td>\r\n"
				+ "			</tr>\r\n"
				+ "			<tr>\r\n"
				+ "				<td colspan=\"2\" style=\"padding-top:15px; text-align:center;\">\r\n"
				+ "				<a href="+host+"login.jsp\"><button style=\"padding:8px 20px; background-color:black; font-family:NanumGothic; color:white; border-radius:5px; border-color:#123478\">로그인</button></a>\r\n"
				+ "				<br><br></td>\r\n"
				+ "			</tr>\r\n"
				+ "			<tr >\r\n"
				+ "				<td colspan=\"2\" style=\"background-color:#F6F6F6; font-family:NanumGothic; height:60px; padding:5px 20px; padding-bottom:15px; font-size:9pt; color:#A6A6A6\">\r\n"
				+ "				본 메일은 발신 전용 메일로 회신이 불가합니다.<br><br>\r\n"
				+ "				궁금하신 사항은 <a href="+host+"qna.jsp\" style=\"text-decoration:none; font-family:NanumGothic ExtraBold\"><font color=\"black\">문의게시판</font></a>을 이용해주시기 바랍니다.\r\n"
				+ "				</td>\r\n"
				+ "			</tr>\r\n"
				+ "			<tr>\r\n"
				+ "			<td>\r\n"
				+ "	</table>\r\n"
				+ "</body>";
		
		// 이메일 전송 : SMTP 이용을 위함
		Properties p = new Properties();
		p.put("mail.smtp.user", from);
		p.put("mail.smtp.host", "smtp.googlemail.com"); // google SMTP 주소
		p.put("mail.smtp.port", "465");
		p.put("mail.smtp.starttls.enable", "true");
		p.put("mail.smtp.auth", "true");
		p.put("mail.smtp.debug", "true");
		p.put("mail.smtp.socketFactory.port", "465");
		p.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
		p.put("mail.smtp.socketFactory.fallback", "false");
		p.put("mail.smtp.ssl.protocols", "TLSv1.2"); // 추가된 코드
		p.put("mail.smtp.ssl.enable", "true");  // 추가된 코드

		try{
			Authenticator auth = new Gmail();
		    Session ses = Session.getInstance(p, auth);
		    ses.setDebug(true);
		    MimeMessage msg = new MimeMessage(ses); 
		    msg.setSubject(subject);		// 메일 제목
		    Address fromAddr = new InternetAddress(from); 	// 보내는 사람 정보
		    msg.setFrom(fromAddr);
		    Address toAddr = new InternetAddress(to);		// 받는 사람 정보
		    msg.addRecipient(Message.RecipientType.TO, toAddr);
		    msg.setContent(content, "text/html;charset=UTF-8");
		    Transport.send(msg); // 메세지 전송
		}catch(Exception e){
			e.printStackTrace();
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('메일 전송 중 오류가 발생했습니다.');");
			script.println("history.back();"); 
			script.println("</script>");
			script.close();
		}
		
		}else if(check==0) {
			response.setCharacterEncoding("UTF-8");
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('입력하신 정보와 일치하는 회원이 없습니다.');");
			script.println("history.back();"); 
			script.println("</script>");
			script.close();
		}else if(check==-1) {
			response.setCharacterEncoding("UTF-8");
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('이메일을 다시 확인해주세요');");
			script.println("history.back();"); 
			script.println("</script>");
			script.close();
		}else if(check==-2) {
			response.setCharacterEncoding("UTF-8");
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('이름을 다시 확인해주세요.');");
			script.println("history.back();"); 
			script.println("</script>");
			script.close();
		}
	return "/index.jsp";
	}

}
