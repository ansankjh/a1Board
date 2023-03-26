package goodee.gdj58.a1.controller;

import java.util.List;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import goodee.gdj58.a1.service.BoardService;
import goodee.gdj58.a1.vo.Board;

@Controller
public class BoardController {
	@Autowired BoardService boardService;
	
	// a1 게시글 삭제 액션
	@GetMapping("/removeBoard")
	public String removeBoard(@RequestParam(value="boardTitle") String boardTitle) {
		
		// System.out.println(boardTitle + "<-- boardTitle 컨트롤러 삭제액션 디버깅");

		boardService.removeBoard(boardTitle);
		
		return "redirect:/boardList";
	}
	
	// a1 게시글 수정 액션
	@PostMapping("/modifyBoard")
	public String modifyBoard(Board board) {
		
		// System.out.println(board.getBoardTitle() + "<-- boardTitle 컨트롤러 수정액션 디버깅");
		// System.out.println(board.getBoardMemo()+ "<-- boardMemo 컨트롤러 수정액션 디버깅");
		// System.out.println(board.getBoardLevel() + "<-- boardLevel 컨트롤러 수정액션 디버깅");
		
		boardService.modifyBoard(board);
		
		return "redirect:/boardList";
	}
	
	// a1 게시글 수정 폼
	@GetMapping("/modifyBoard")
	public String modifyBoard(Model model
								, @RequestParam(value="boardTitle") String boardTitle
								, @RequestParam(value="boardMemo") String boardMemo
								, @RequestParam(value="boardName") String boardName
								, @RequestParam(value="boardLevel") String boardLevel) {
		// System.out.println(boardTitle + "<-- boardTitle");
		// System.out.println(boardMemo + "<-- boardMemo");
		// System.out.println(boardLevel + "<-- boardLevel");
		
		model.addAttribute("boardTitle", boardTitle);
		model.addAttribute("boardMemo", boardMemo);
		model.addAttribute("boardName", boardName);
		model.addAttribute("boardLevel", boardLevel);
		
		
		return "modifyBoard";
	}
	
	// a1 게시판 글등록 액션
	@PostMapping("/addBoard")
	public String addBoard(Board board, RedirectAttributes redirectAttributes) {
		// System.out.println(board + "<-- board");
		redirectAttributes.addAttribute("boardName", board.getBoardName());
		
		boardService.addBoard(board);
		
		return "redirect:/boardList";
	}
	
	// a1 게시판 글등록 폼
	@GetMapping("/addBoard")
	public String addBoard(Model model
							, @RequestParam(value="boardName", required = false) String boardName) {
		
		if(boardName != null) {
			// System.out.println(boardName + "<-- boardName 컨트롤러 게시글 조회 디버깅");
			model.addAttribute("boardName", boardName);
		}
		
		return "addBoard";
	}
	
	// a1 게시글 조회
	@GetMapping("/boardList")
	public String boardList(Model model
								, @RequestParam(value="boardName", required = false) String boardName
								, @RequestParam(value="currentPage", defaultValue = "1") int currentPage
								, @RequestParam(value="rowPerPage", defaultValue = "3") int rowPerPage) {
		
		// System.out.println(word + "<-- word 컨트롤러 검색어 조회 디버깅");
		// System.out.println(category + "<-- category 컨트롤러 검색어 조회 디버깅");
		
		// 한번 작성한 닉네임 다음번 게시물 작성시 자동으로 입력
		if(boardName != null) {
			// System.out.println(boardName + "<-- boardName 컨트롤러 게시글 조회 디버깅");
			model.addAttribute("boardName", boardName);
		}
		
		List<Board> list = boardService.getBoardList();
		
		model.addAttribute("list", list);
		
		return "boardList";
	}
}
