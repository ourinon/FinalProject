package com.study.game.Controller;

import java.io.File;
import java.io.IOException;
import java.util.Date;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.study.game.dao.FileUploadDto;
import com.study.game.dto.BoardDTO;
import com.study.game.dto.GameDto;
import com.study.game.serviceImpl.GameServiceImpl;
import com.sun.tools.javac.code.Attribute.Array;

@Controller
@RequestMapping(value = "/crud")
public class CrudController {
			@Autowired
			GameServiceImpl gameService;
			
			// inputPage 이동
			@RequestMapping(value = "/input", method = RequestMethod.GET)
			public String createPage() {
				return "Crud/input";
			}
			
			//input 로직
			@RequestMapping(value = "/input", method = RequestMethod.POST)
			public String create(GameDto game, HttpServletRequest req,HttpSession session) throws IllegalStateException, IOException {
			      Date date = new Date();
			      StringBuilder sb = new StringBuilder();
			      int[] checkArr = new int[9];
			      
			      for(int i = 0; i < checkArr.length; i++) {
			    	  if(req.getParameter("check"+i) != null) {
			    		  checkArr[i] = Integer.parseInt(req.getParameter("check"+i));
			    	  }
			      }
			      System.out.println("여기는 넘어옴");
			      System.out.println("boardInputProcess >>>>>>");
					// p.420 ~ p.427 까지 내용 참고
					// 파일 업로드 처리
					MultipartFile uploadFile = game.getImg();
					String saveDirectory = session.getServletContext().getRealPath("resources/img/upload");
					//String saveDirectory = "C:/Users/jqwes/OneDrive/바탕 화면/GameProject123321/src/main/webapp/resources/img/upload";
					System.out.println(saveDirectory);
					
					if(!uploadFile.isEmpty()) {
						sb.append(date.getTime());
						sb.append(uploadFile.getOriginalFilename());
						//String fileName = uploadFile.getOriginalFilename();
					}else {
						 sb.append("none");
					}
					
					String imgPath = saveDirectory + "\\" + sb.toString();
					uploadFile.transferTo(new File(imgPath));
					
					//String imgName = req.getContextPath()+"/resources/img/upload/"+sb.toString();
					String imgName = req.getContextPath()+"/resources/img/upload/"+sb.toString();
					game.setTitleImg(imgName);
					System.out.println("이미지네임:"+req.getContextPath());
					System.out.println("컨텍스트패스"+imgName);
					System.out.println(game);
					game.setPc(checkArr[0]);
					game.setMobile(checkArr[1]);
					game.setConsole(checkArr[2]);
					game.setAction(checkArr[3]);
					game.setAdventureAndCasual(checkArr[4]);
					game.setRolePlaying(checkArr[5]);
					game.setSimulation(checkArr[6]);
					game.setStrategy(checkArr[7]);
					game.setSportsAndracing(checkArr[8]);
					
					
					System.out.println("게임 이미지:" + game.getTitleImg());
					
					gameService.createGame(game);
					System.out.println(gameService.getAllList());
					return "redirect:/";

			}
}
			
//			@RequestMapping(value = "/input.do", method = RequestMethod.POST)
//			public String boardInputProcess(HttpSession session, BoardDTO dto) throws IOException {
//				System.out.println("boardInputProcess >>>>>>");
//				// p.420 ~ p.427 까지 내용 참고
//				// 파일 업로드 처리
//				MultipartFile uploadFile = dto.getUploadFile();
//				String saveDirectory = session.getServletContext().getRealPath("/upload");
//				
//				System.out.println(saveDirectory);
//				if(!uploadFile.isEmpty()) {
//					String fileName = uploadFile.getOriginalFilename();
//					uploadFile.transferTo(new File(saveDirectory + "\\" + fileName));
//				}
//				//dao.insertBoard(dto);
//				return "redirect:/";
//			}
//}
			
			
//			@RequestMapping("upload")
//			   public ResponseEntity<String> createFeed(@RequestParam("uploadFile") MultipartFile file) {
//			      // 시간과 originalFilename으로 매핑 시켜서 src 주소를 만들어 낸다.
//
//			      System.out.println("로그인할떄 사용한 세션 : " + loginSession);
//			      session = sessionMap.get(sessionId);
//			      session.getAttributeNames();
//			      UserDto newUser = (UserDto) session.getAttribute("user");
//			      System.out.println(newUser);
//
//			      Date date = new Date();
//			      StringBuilder sb = new StringBuilder();
//			      System.out.println("여기는 넘어옴");
//
//			      // file image 가 없을 경우
//			      if (file.isEmpty()) {
//			         sb.append("none");
//			      } else {
//			         sb.append(date.getTime());
//			         sb.append(file.getOriginalFilename());
//			      }
//			      String fad = "D:/FinalFolder/G-BeeProject/G-BeeWiki/src/main/resources/static/img" + sb.toString();
////			      System.out.println("GetEml : " + newUser.getUserEmail());
//
//			      if (!file.isEmpty()) {
//			         File dest = new File(fad);
//			         try {
//			            file.transferTo(dest);
////			            String absolutePath = System.getProperty("/G-BeeWiki/src/main/resources/static/img");
////			            String fad2 = absolutePath + dest;
////			            File dest2 = new File(fad2);
////			            file.transferTo(dest2);
//			            
//			            
//			         } catch (IllegalStateException e) {
//			            e.printStackTrace();
//			         } catch (IOException e) {
//			            e.printStackTrace();
//			         }
//			         // db에 파일 위치랑 번호 등록
//			         newUser.setUserImg(fad);
////			         System.out.println("GetImg : "+newUser.getUserImg());
//			         userService.updateImg(newUser);
//			      }
//			      return new ResponseEntity<String>(HttpStatus.OK);
//			   }
//
//			
//			// feed image 반환하기
//			@RequestMapping(value = "image/{imagename}")
//			public ResponseEntity<byte[]> userSearch(@PathVariable("imagename") String imagename) throws IOException {
//			      InputStream imageStream = new FileInputStream(imagename);
//			      byte[] imageByteArray = IOUtils.toByteArray(imageStream);
//			      imageStream.close();
//			      return new ResponseEntity<byte[]>(imageByteArray, HttpStatus.OK);
//			}
