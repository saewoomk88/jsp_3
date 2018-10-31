package com.iu.member;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.iu.util.DBControl;

public class MemberDAO {
	
	public int join(MemberDTO memberDTO)throws Exception{
		Connection con = DBControl.getconnect();
		String sql = "insert into member values(?,?,?,?,?,?,?,?)";
		PreparedStatement st = con.prepareStatement(sql);
		st.setString(1, memberDTO.getId());
		st.setString(2, memberDTO.getPw());
		st.setString(3, memberDTO.getName());
		st.setString(4, memberDTO.getEmail());
		st.setString(5, memberDTO.getKind());
		st.setString(6, memberDTO.getClassMate());
		st.setString(7, memberDTO.getFname());
		st.setString(8, memberDTO.getOname());
		int result = st.executeUpdate();
		
		DBControl.disconnect(st, con);
		return result;
	}
	
	
	public MemberDTO selectOne(MemberDTO memberDTO) throws Exception{
		Connection con = DBControl.getconnect();
		String sql = "select * from member where id=? and pw=?";
		PreparedStatement st = con.prepareStatement(sql);
		st.setString(1, memberDTO.getId());
		st.setString(2, memberDTO.getPw());
		ResultSet rs = st.executeQuery();
		MemberDTO mDTO = null;
		if(rs.next()) {
			mDTO = new MemberDTO();
			mDTO.setId(rs.getString("id"));
			mDTO.setName(rs.getString("name"));
			mDTO.setEmail(rs.getString("email"));
			
			
		}
		DBControl.disconnect(rs, st, con);
		return mDTO;
		
	}
	
	public int delete(String id) throws Exception{
		Connection con = DBControl.getconnect();
		String sql = "delete member where id=?";
		PreparedStatement st = con.prepareStatement(sql);
		st.setString(1, id);
		int result = st.executeUpdate();
		DBControl.disconnect(st, con);
		
		
		return result;
	}
	
	

}
