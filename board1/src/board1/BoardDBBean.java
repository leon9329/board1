package board1;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class BoardDBBean {
	
	private static BoardDBBean instance = new BoardDBBean();
	
	public static BoardDBBean getInstance() {
		return instance;
	}

	public  Connection getConnection() throws Exception {
		  // InitialContext 객체를 생성해서 initCtx 레퍼런스에 할당
	      Context init= new InitialContext();
		  DataSource ds = (DataSource)init.lookup("java:comp/env/jdbc/Orcl");
		  Connection con = ds.getConnection();
		  
	      return con;
	    }
	
	//데이터 삽입
	public int insert(BoardDataBean board) {
		int result=0;
		Connection conn=null;
		PreparedStatement pstmt=null;
		
		
		try {
			conn=getConnection();
			String sql="insert into board0 values(board0_seq.nextval,?,?,?,?,sysdate,?,?,?,board0_seq.nextval,?,?)";
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, board.getWriter());
			pstmt.setString(2, board.getEmail());
			pstmt.setString(3, board.getSubject());
			pstmt.setString(4, board.getPasswd());
			pstmt.setInt(5, 0);//readcount
			pstmt.setString(6, board.getContent());
			pstmt.setString(7, board.getIp());
			pstmt.setInt(8, 0);//re_step
			pstmt.setInt(9, 0);//re_level
			
			result=pstmt.executeUpdate();
			
			
			
		} catch (Exception e) {
			// TODO: handle exception
			e.getStackTrace();
		}finally {
			if(pstmt != null) try {pstmt.close();} catch(Exception e) {}
			if(conn != null) try {conn.close();} catch(Exception e) {}
			
		}
		return result;
	}
	
	//데이터 총 갯수 구하기
	public int getCount() {
		int result=0;
		Connection conn=null;
		PreparedStatement pstmt=null;
		ResultSet rs = null;
		
		try {
			conn=getConnection();
			String sql="select count(*) from board0";
			pstmt=conn.prepareStatement(sql);
			rs=pstmt.executeQuery();
			if(rs.next()) {
				result=rs.getInt(1);
			}
			
		} catch (Exception e) {
			// TODO: handle exception
			e.getStackTrace();
		}finally {
			if(rs!= null) try {rs.close();} catch(Exception e) {}
			if(pstmt != null) try {pstmt.close();} catch(Exception e) {}
			if(conn != null) try {conn.close();} catch(Exception e) {}
		}
		return result;
	}
	
	//데이터 리스트 page_size만큼 받아오기
	public List<BoardDataBean> getList(int start, int end){
		List<BoardDataBean> list=new ArrayList<BoardDataBean>();
		Connection conn=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		
		try {
			conn=getConnection();
			String sql="select * from (select rownum rnum,num,writer,email,subject,"
					+ "passwd,reg_date,readcount,content,ip,ref,re_step,re_level"
					+ " from(select * from board0 order by ref desc,re_step asc))"
					+ " where rnum>=? and rnum<=?";
			
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, start);
			pstmt.setInt(2, end);
			rs=pstmt.executeQuery();
			
			while(rs.next()) {
				BoardDataBean board=new BoardDataBean();
				board.setNum(rs.getInt(2));
				board.setWriter(rs.getString(3));
				board.setEmail(rs.getString(4));
				board.setSubject(rs.getString(5));
				board.setPasswd(rs.getString(6));
				board.setReg_date(rs.getTimestamp(7));
				board.setReadcount(rs.getInt(8));
				board.setContent(rs.getString(9));
				board.setIp(rs.getString(10));
				board.setRef(rs.getInt(11));
				board.setRe_step(rs.getInt(12));
				board.setRe_level(rs.getInt(13));
				
				list.add(board);
			}
		} catch (Exception e) {
			// TODO: handle exception
			e.getStackTrace();
		}finally {
			if(rs!= null) try {rs.close();} catch(Exception e) {}
			if(pstmt != null) try {pstmt.close();} catch(Exception e) {}
			if(conn != null) try {conn.close();} catch(Exception e) {}
		}
		
		return list;
	}
	
	public BoardDataBean updateCount(int num) {	//조회수증가 + 게시글 1개에 대한 정보구하기
		BoardDataBean board=new BoardDataBean();
		Connection conn=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		
		try {
			conn=getConnection();
			//조회수 1 증가
			String sql="update board0 set readcount=readcount+1 where num=?";
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, num);
			pstmt.executeUpdate();
			
			//게시글 1개 정보 얻어오기
			sql="select * from board0 where num=?";
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, num);
			rs=pstmt.executeQuery();
			
			if(rs.next()) {
				board.setNum(rs.getInt(1));
				board.setWriter(rs.getString(2));
				board.setEmail(rs.getString(3));
				board.setSubject(rs.getString(4));
				board.setPasswd(rs.getString(5));
				board.setReg_date(rs.getTimestamp(6));
				board.setReadcount(rs.getInt(7));
				board.setContent(rs.getString(8));
				board.setIp(rs.getString(9));
				board.setRef(rs.getInt(rs.getInt(10)));
				board.setRe_step(rs.getInt(rs.getInt(11)));
				board.setRe_level(rs.getInt(rs.getInt(12)));
				
			}
			
		} catch (Exception e) {
			// TODO: handle exception
		}finally {
			if(rs!= null) try {rs.close();} catch(Exception e) {}
			if(pstmt != null) try {pstmt.close();} catch(Exception e) {}
			if(conn != null) try {conn.close();} catch(Exception e) {}
		}
		return board;
	}
	
	public BoardDataBean getContent(int num) {	//게시글 1개에 대한 정보구하기
		BoardDataBean board=new BoardDataBean();
		Connection conn=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		
		try {
			conn=getConnection();
			String sql="select * from board0 where num=?";
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, num);
			rs=pstmt.executeQuery();
			
			if(rs.next()) {
				board.setNum(rs.getInt(1));
				board.setWriter(rs.getString(2));
				board.setEmail(rs.getString(3));
				board.setSubject(rs.getString(4));
				board.setPasswd(rs.getString(5));
				board.setReg_date(rs.getTimestamp(6));
				board.setReadcount(rs.getInt(7));
				board.setContent(rs.getString(8));
				board.setIp(rs.getString(9));
				board.setRef(rs.getInt(10));
				board.setRe_step(rs.getInt(11));
				board.setRe_level(rs.getInt(12));
				
				
			}
			
		} catch (Exception e) {
			// TODO: handle exception
		}finally {
			if(rs!= null) try {rs.close();} catch(Exception e) {}
			if(pstmt != null) try {pstmt.close();} catch(Exception e) {}
			if(conn != null) try {conn.close();} catch(Exception e) {}
		}
		return board;
	}
	
	//정보 수정
	public void update(BoardDataBean board) {
		Connection conn=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		
		try {
			conn=getConnection();
			String sql="update board0 set writer=?,subject=?,email=?,content=? where num=?";//이름,제목,이메일,내용
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, board.getWriter());
			pstmt.setString(2, board.getSubject());
			pstmt.setString(3, board.getEmail());
			pstmt.setString(4, board.getContent());
			pstmt.setInt(5, board.getNum());
			pstmt.executeUpdate();
			
		} catch (Exception e) {
			// TODO: handle exception
		}finally {
			if(rs!= null) try {rs.close();} catch(Exception e) {}
			if(pstmt != null) try {pstmt.close();} catch(Exception e) {}
			if(conn != null) try {conn.close();} catch(Exception e) {}
		}
		
	}
	
	//글 삭제
	public void delete(int num) {
		Connection conn=null;
		PreparedStatement pstmt=null;
		
		try {
			conn=getConnection();
			String sql="delete from board0 where num=?";
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, num);
			pstmt.executeUpdate();
			
		} catch (Exception e) {
			// TODO: handle exception
		}finally {
			if(pstmt != null) try {pstmt.close();} catch(Exception e) {}
			if(conn != null) try {conn.close();} catch(Exception e) {}
		}
	}
	
	//댓글달기
	public int reply(BoardDataBean board) {
		int result=0;
		Connection conn=null;
		PreparedStatement pstmt=null;
		
		//부모의 댓글정보
		int ref=board.getRef();
		int re_step=board.getRe_step();
		int re_level=board.getRe_level();
		
		try {
			conn=getConnection();
			
			String sql="update board0 set re_step=re_step+1 where ref=? and re_step>?";//re_step은 오름차순 정렬 ref는 내림차순 정렬
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, ref);
			pstmt.setInt(2, re_step);
			pstmt.executeUpdate();
			
			
			sql="insert into board0 values(board0_seq.nextval,?,?,?,?,sysdate,?,?,?,?,?,?)";
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, board.getWriter());
			pstmt.setString(2, board.getEmail());
			pstmt.setString(3, board.getSubject());
			pstmt.setString(4, board.getPasswd());
			pstmt.setInt(5, 0);//readcount
			pstmt.setString(6, board.getContent());
			pstmt.setString(7, board.getIp());
			pstmt.setInt(8, ref);//ref
			pstmt.setInt(9, re_step+1);//re_step
			pstmt.setInt(10, re_level+1);//re_level
			
			result = pstmt.executeUpdate();
			
			
		} catch (Exception e) {
			// TODO: handle exception
			e.getStackTrace();
		}finally {
			if(pstmt != null) try {pstmt.close();} catch(Exception e) {}
			if(conn != null) try {conn.close();} catch(Exception e) {}
			
		}
		return result;
	}
}
