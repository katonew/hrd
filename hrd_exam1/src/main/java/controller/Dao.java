package controller;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import Dto.MemberDto;
import Dto.MoneyDto;

public class Dao {
	
	public static Connection con;
	public static PreparedStatement ps;
	public static ResultSet rs;
	
	public static Connection getConnection() throws Exception{
		
		Class.forName("com.mysql.cj.jdbc.Driver");
		con = DriverManager.getConnection("jdbc:mysql://localhost:3306/xe", "root","1234");
		return con;
		
	}
	
	public Dao(){
		try {
			con = getConnection();
		} catch (Exception e) {
			System.out.println(e);
		}
	}
	
	// 1. 마지막 회원번호 +1 가져오기
	public int getcustno() {
		String sql = "select max(custno)+1 from member_tbl_02;";
		try {
			ps = con.prepareStatement(sql);
			rs = ps.executeQuery();
			if(rs.next()) {
				return rs.getInt(1);
			}
		} catch (Exception e) {
			System.out.println(e);
		}
		return 0;
	} //getcustno e
	
	// 2. 회원등록
	public boolean join(MemberDto dto) {
		String sql = "insert into member_tbl_02 values(?, ?, ?, ?, ?, ?, ?);";
		try {
			ps = con.prepareStatement(sql);
			ps.setInt(1, dto.getCustno());
			ps.setString(2, dto.getCustname());
			ps.setString(3, dto.getPhone());
			ps.setString(4, dto.getAddress());
			ps.setString(5, dto.getJoindate());
			ps.setString(6, dto.getGrade());
			ps.setString(7, dto.getCity());
			int count = ps.executeUpdate();
			if(count==1) {return true;}
		} catch (Exception e) {System.out.println(e);}
		return false;
	}
	
	// 3. 회원목록 가져오기
	public ArrayList<MemberDto> getMemberList(){
		ArrayList<MemberDto> list = new ArrayList<>();
		String sql = "select *from member_tbl_02";
		try {
			ps =con.prepareStatement(sql);
			rs = ps.executeQuery();
			while(rs.next()) {
				MemberDto dto = new MemberDto(
						rs.getInt(1), rs.getString(2), rs.getString(3),
						rs.getString(4), rs.getString(5), rs.getString(6), rs.getString(7));
				list.add(dto);
			}
			
		} catch (Exception e) {System.out.println(e);}
		return list;
	}
	// 4. 특정 회원 출력
	public MemberDto getmember(int custno) {
		String sql ="select *from member_tbl_02 where custno = "+custno;
		try {
			ps =con.prepareStatement(sql);
			rs = ps.executeQuery();
			if(rs.next()) {
				return new MemberDto(
						rs.getInt(1), rs.getString(2), rs.getString(3),
						rs.getString(4), rs.getString(5), rs.getString(6), rs.getString(7));
			}} catch (Exception e) {System.out.println(e);}
		return null;
	}
	
	// 5. 회원수정
	public boolean update(MemberDto dto) {
		String sql = "update member_tbl_02 set custno=? , custname=? , phone=? , address=? , joindate=? , grade=? , city=?  where custno = ?";
		try {
			ps = con.prepareStatement(sql);
			ps.setInt(1, dto.getCustno());
			ps.setString(2, dto.getCustname());
			ps.setString(3, dto.getPhone());
			ps.setString(4, dto.getAddress());
			ps.setString(5, dto.getJoindate());
			ps.setString(6, dto.getGrade());
			ps.setString(7, dto.getCity());
			ps.setInt(8, dto.getCustno());
			int count = ps.executeUpdate();
			if(count==1) {return true;}
		} catch (Exception e) {System.out.println(e);}
		return false;
	}
	
	
	// 6. 매출정보 가져오기
	public ArrayList<MoneyDto> getmoneyList() {
		ArrayList<MoneyDto> list = new ArrayList<>();
		String sql = "select mem.custno,mem.custname,mem.grade,sum(mon.price) as sum from money_tbl_02 mon natural join member_tbl_02 mem group by mon.custno order by sum desc";
		try {
			ps = con.prepareStatement(sql);
			rs = ps.executeQuery();
			while(rs.next()) {
				MoneyDto dto = new MoneyDto(rs.getString(1), rs.getString(2), rs.getString(3), rs.getInt(4));
				list.add(dto);
				System.out.println("dto :" + dto);
			}
		} catch (Exception e) {System.out.println(e);}
		return list;
	}
		
}
