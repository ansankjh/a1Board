package goodee.gdj58.a1.dao;

import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Repository;

import goodee.gdj58.a1.vo.Board;

@Repository
public class BoardDao {
	// 게시판 정보를 저장할 리스트 생성(DB 대용)
	private List<Board> boardList = new ArrayList<>();
	
	// a1 게시글 삭제
	public void deleteBoard(String boardTitle) {
		System.out.println(boardTitle + "<-- boardTitle 삭제액션 디버깅");
		for(int i=0; i<boardList.size(); i++) {
			if(boardTitle.equals(boardList.get(i).getBoardTitle())) {
				boardList.remove(i);
			}
		}
	}
	
	// a1 게시글 수정
	public void updateBoard(Board board) {
		// System.out.println(boardList.get(0) + "<-- boardList 0번인덱스 DAO 수정액션 디버깅");
		// System.out.println(board + "<-- board DAO 수정액션 디버깅");
		for(int i=0; i<boardList.size(); i++) {
			if(boardList.get(i).getBoardTitle().equals(board.getBoardTitle())) {
				boardList.set(i, board);
			}
		}
	}
	
	// a1 게시글 등록
	public void insertBoard(Board board) {
		// System.out.println("Repository param insert : "+ board.getBoardTitle());
		// System.out.println("Repository param insert : "+ board.getBoardMemo());
		// System.out.println("Repository param insert : "+ board.getBoardName());
		// System.out.println("Repository param insert : "+ board.getBoardLevel());
		boardList.add(board);
	}
	
	// a1 게시판 조회
	public List<Board> selectBoardList() {
		return boardList;
	}
}
