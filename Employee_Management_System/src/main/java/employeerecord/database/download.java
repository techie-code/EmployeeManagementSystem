package employeerecord.database;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStreamWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.swing.text.StyleConstants.FontConstants;

import com.itextpdf.io.font.constants.StandardFonts;
import com.itextpdf.kernel.colors.Color;
import com.itextpdf.kernel.colors.DeviceRgb;
import com.itextpdf.kernel.font.PdfFont;
import com.itextpdf.kernel.font.PdfFontFactory;
import com.itextpdf.layout.element.Cell;
import com.itextpdf.layout.element.Table;
import com.itextpdf.text.BaseColor;
import com.itextpdf.text.Document;
import com.itextpdf.text.DocumentException;
import com.itextpdf.text.Element;
import com.itextpdf.text.Font;
import com.itextpdf.text.FontFactory;
import com.itextpdf.text.PageSize;
import com.itextpdf.text.Paragraph;
import com.itextpdf.text.Phrase;
import com.itextpdf.text.Rectangle;
import com.itextpdf.text.pdf.PdfPCell;
import com.itextpdf.text.pdf.PdfPTable;
import com.itextpdf.text.pdf.PdfWriter;
import com.opencsv.CSVWriter;

public class download {
	public boolean pdfdownload(String filepath) throws DocumentException, SQLException, IOException{
		Connection con = null;
		PreparedStatement ps = null;
		try{
			Class.forName("com.mysql.jdbc.Driver");
			con = DriverManager.getConnection("jdbc:mysql://localhost/database","root","root");
			System.out.println("Connected");
		}catch(Exception e){
		System.out.println("Not connected");
		}		
		int count=0;
		Rectangle page=new Rectangle(PageSize.A2);
		page.setBackgroundColor(new BaseColor(0,0,0));
		Document doc=new Document(page);
		PdfWriter.getInstance(doc,new FileOutputStream(filepath));
		Paragraph para=new Paragraph("EMPLOYEE MANAGEMENT SYSTEM",FontFactory.getFont(FontFactory.COURIER,30,Font.BOLD,BaseColor.CYAN));
		para.setAlignment(Element.ALIGN_CENTER);
		para.setSpacingBefore(30);
		para.setSpacingAfter(30);
		PdfPTable pdftable=new PdfPTable(8);
		float[] columnWidths = new float[]{30f, 30f, 10f, 30f,30f, 30f, 30f, 30f};
		pdftable.setWidths(columnWidths);
		PdfPCell p=new PdfPCell(new Phrase("Employee ID",FontFactory.getFont(FontFactory.COURIER,12,Font.BOLD,BaseColor.WHITE)));
		p.setBorderColor(new BaseColor(0, 255, 255));
		pdftable.addCell(p);
		p=new PdfPCell(new Phrase("Name",FontFactory.getFont(FontFactory.COURIER,12,Font.BOLD,BaseColor.WHITE)));
		p.setBorderColor(new BaseColor(0, 255, 255));
		pdftable.addCell(p);
		p=new PdfPCell(new Phrase("Age",FontFactory.getFont(FontFactory.COURIER,12,Font.BOLD,BaseColor.WHITE)));
		p.setBorderColor(new BaseColor(0, 255, 255));
		pdftable.addCell(p);
		p=new PdfPCell(new Phrase("Address",FontFactory.getFont(FontFactory.COURIER,12,Font.BOLD,BaseColor.WHITE)));
		p.setBorderColor(new BaseColor(0, 255, 255));
		pdftable.addCell(p);
		p=new PdfPCell(new Phrase("Gender",FontFactory.getFont(FontFactory.COURIER,12,Font.BOLD,BaseColor.WHITE)));
		p.setBorderColor(new BaseColor(0, 255, 255));
		pdftable.addCell(p);
		p=new PdfPCell(new Phrase("Email",FontFactory.getFont(FontFactory.COURIER,12,Font.BOLD,BaseColor.WHITE)));
		p.setBorderColor(new BaseColor(0, 255, 255));
		pdftable.addCell(p);
		p=new PdfPCell(new Phrase("Mobile",FontFactory.getFont(FontFactory.COURIER,12,Font.BOLD,BaseColor.WHITE)));
		p.setBorderColor(new BaseColor(0, 255, 255));
		pdftable.addCell(p);
		p=new PdfPCell(new Phrase("Department",FontFactory.getFont(FontFactory.COURIER,12,Font.BOLD,BaseColor.WHITE)));
		p.setBorderColor(new BaseColor(0, 255, 255));
		pdftable.addCell(p);
		pdftable.setHeaderRows(1);
		ps = con.prepareStatement("SELECT * FROM employee1");
		ResultSet rs = ps.executeQuery();
		while(rs.next()) {
			p=new PdfPCell(new Phrase(rs.getString(1), FontFactory.getFont(FontFactory.COURIER,10,BaseColor.WHITE)));
			p.setBorderColor(new BaseColor(0, 255, 255));
			pdftable.addCell(p);
			p=new PdfPCell(new Phrase(rs.getString(2), FontFactory.getFont(FontFactory.COURIER,10,BaseColor.WHITE)));
			p.setBorderColor(new BaseColor(0, 255, 255));
			pdftable.addCell(p);
			p=new PdfPCell(new Phrase(rs.getString(3), FontFactory.getFont(FontFactory.COURIER,10,BaseColor.WHITE)));
			p.setBorderColor(new BaseColor(0, 255, 255));
			pdftable.addCell(p);
			p=new PdfPCell(new Phrase(rs.getString(4), FontFactory.getFont(FontFactory.COURIER,10,BaseColor.WHITE)));
			p.setBorderColor(new BaseColor(0, 255, 255));
			pdftable.addCell(p);
			p=new PdfPCell(new Phrase(rs.getString(5), FontFactory.getFont(FontFactory.COURIER,10,BaseColor.WHITE)));
			p.setBorderColor(new BaseColor(0, 255, 255));
			pdftable.addCell(p);
			p=new PdfPCell(new Phrase(rs.getString(6), FontFactory.getFont(FontFactory.COURIER,10,BaseColor.WHITE)));
			p.setBorderColor(new BaseColor(0, 255, 255));
			pdftable.addCell(p);
			p=new PdfPCell(new Phrase(rs.getString(7), FontFactory.getFont(FontFactory.COURIER,10,BaseColor.WHITE)));
			p.setBorderColor(new BaseColor(0, 255, 255));
			pdftable.addCell(p);
			p=new PdfPCell(new Phrase(rs.getString(8), FontFactory.getFont(FontFactory.COURIER,10,BaseColor.WHITE)));
			p.setBorderColor(new BaseColor(0, 255, 255));
			pdftable.addCell(p);
			count=count+1;
			System.out.println(count);
		}
		doc.open(); 
		doc.add(para);
		doc.add(pdftable);
		doc.close();
		return true;
		
	}
	public boolean csvdownload(String path) throws SQLException, IOException {
		Connection con = null;
		PreparedStatement ps = null;
		int count=0;
		try{
			Class.forName("com.mysql.jdbc.Driver");
			con = DriverManager.getConnection("jdbc:mysql://localhost/database","root","root");
			System.out.println("Connected");
		}catch(Exception e){
		System.out.println("Not connected");
		}
		FileOutputStream fos=new FileOutputStream(path);
		OutputStreamWriter outputwriter=new OutputStreamWriter(fos);
		CSVWriter write=new CSVWriter(outputwriter);
		List<String[]> list=new ArrayList<String[]>();
		String[]data= {"EmployeeID","Name","Age","Address","Gender","Email","Mobile","Department"};
		list.add(data);
		ps = con.prepareStatement("SELECT * FROM employee1");
		ResultSet rs = ps.executeQuery();
		while(rs.next()) {
			String []datas= {rs.getString(1),rs.getString(2),rs.getString(3),rs.getString(4),rs.getString(5),rs.getString(6),rs.getString(7),rs.getString(8)};
			list.add(datas);
		}
		write.writeAll(list);
		write.close();
		outputwriter.close();
		fos.close();
		return true;
	}
}
