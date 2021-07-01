package com.springboot.service;



import java.text.DecimalFormat;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;
import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Service;

import com.springboot.model.Orders;
import com.springboot.model.Product;
import com.springboot.reponsitory.UserReponsitory;





@Service
public class MailService {
	@Autowired
	JavaMailSender sender;
	@Autowired
	UserReponsitory userReponsitory;
	private List<MimeMessage> mailList = new ArrayList<>();
	
	public void pushMail(Orders order, Map<Product, Integer> listItems) {
		DecimalFormat email = new DecimalFormat("###,###,###");
		String content = " <!DOCTYPE html>\r\n"
				+ "<html lang=\"en\">\r\n"
				+ "\r\n"
				+ "<head>\r\n"
				+ "    <meta charset=\"UTF-8\">\r\n"
				+ "    <meta http-equiv=\"X-UA-Compatible\" content=\"IE=edge\">\r\n"
				+ "    <meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\">\r\n"
				+ "    <title>Document</title>\r\n"
				+ "</head>\r\n"
				+ "\r\n"
				+ "<body>\r\n"
				+ "    <div style=\"width: 800px; font-family: tahoma;\">\r\n"
				+ "        <h2>Đặt hàng thành công</h2>\r\n"
				+ "        <p>Khách hàng: <a style=\"color: red; font-weight: bold;\">"+order.getName()+"</a></p>\r\n"
				+ "        <p>Số điện thoại: <a style=\"color: red; font-weight: bold;\">"+order.getPhoneNumber()+"</a></p>\r\n"				
				+ "    </div>\r\n"
				+ "    <div style=\"width: 800px;\">\r\n"
				+ "        <h3>CHI TIẾT ĐƠN HÀNG</h3>\r\n"
				+ "        <p style=\" color: #ccc; font-style: italic; position: absolute; margin-left: 600px; margin-top: -40px;\">x</p>\r\n"
				+ "        <table>\r\n"
				+ "            <thead>\r\n"
				+ "                <tr>\r\n"
				+ "                    <th style=\"width: 200px; text-align: center;\">Tên sản phẩm</th>\r\n"
				+ "                    <th style=\"width: 250px; text-align: center;\">Đơn giá</th>\r\n"
				+ "                    <th style=\"width: 200px; text-align: center;\">Số lượng</th>\r\n"
				+ "                    <th style=\"width: 250px; text-align: center;\">Thành tiền</th>\r\n"
				+ "                </tr>\r\n"
				+ "            </thead>\r\n"
				+ "            <tbody>\r\n";
								double Tong = 0;
								for(Product dt : listItems.keySet()) {
									
									String name = dt.getName();
									double gia = dt.getPrice();
									int soluong = listItems.get(dt);
									double thanhTien = gia * soluong;
									Tong += thanhTien;
									String item = "<tr>";
									item += "<td style=\"width: 400px; text-align: center; color: green;\">"+name+"</td>";
									item += "<td style=\"width: 250px; text-align: center; color: red;\">"+email.format(gia)+" đ</td>";
									item +=  "<td style=\"width: 100px; text-align: center;\">"+soluong+" chiếc</td>";
									item +=  "<td style=\"width: 250px; text-align: center; color: red;\">"+email.format(thanhTien)+" đ</td>";
									item += "</tr>";
									
									content += item;
								}

				content += "            </tbody>\r\n"
				+ "        </table>\r\n"
				+ "        <p>Email: <a style=\"color: red; font-weight: bold;\">"+order.getEmail()+"</a></p>\r\n"
				+ "        <p>Địa chỉ: <a style=\"color: red; font-weight: bold;\">"+order.getAddress()+"</a></p>\r\n"
				+ "    </div>\r\n"
				+ "    <div style=\"width: 700px; text-align: right; font-size: 18px;\">\r\n"
				+ "        <p>Tổng tiền: <a style=\"font-weight: bold;\">"+email.format(Tong)+"</a></p>\r\n"
				+ "    </div>\r\n"
				+ "    <div style=\"width: 700px; text-align: center; color: rgb(9, 54, 3);\">\r\n"
				+ "        <p>Cảm ơn bạn đã đặt hàng!</p>\r\n"
				+ "\r\n"
				+ "    </div>\r\n"
				+ "</body>\r\n"
				+ "\r\n"
				+ "</html>";
				
		
		MimeMessage message = sender.createMimeMessage();
		MimeMessageHelper helper = new MimeMessageHelper(message);
		try {
			helper.setFrom("Pham Dinh Hieu <phamdinhhieu297@gmail.com>");
			helper.setTo(order.getEmail());
			helper.setSubject("Cảm ơn bạn đã đặt hàng");
			helper.setText(content,true);		
			  
		} catch (MessagingException e) {
			System.out.println("Không thể thêm mail vào hàng đợi");
			e.printStackTrace();
		}
		mailList.add(message);
	}

	@Scheduled(fixedDelay = 2000)
	public void run() {
		while (!mailList.isEmpty()) {
			MimeMessage message = mailList.remove(0);
			try {
				sender.send(message);
			} catch (Exception e) {
				System.out.println("Gửi mail lỗi");
				e.printStackTrace();
			}
		}
	}
 }
