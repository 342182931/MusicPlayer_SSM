package com.xu.ssm.controller;

import java.io.File;
import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.FileUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.xu.ssm.po.MusicCustom;
import com.xu.ssm.po.MusicQueryVo;
import com.xu.ssm.po.PageBean;
import com.xu.ssm.po.UserCustom;
import com.xu.ssm.service.MusicService;
import com.xu.ssm.tools.FileRenameUtil;
import com.xu.ssm.tools.PropertyUtil;

@Controller
public class MusicController {
	@Autowired
	private MusicService musicService;

	@RequestMapping("/houtai/findMusicListByPage")
	public String findMusicListByPage(MusicQueryVo musicQueryVo, Model model, Integer currPage) throws Exception {
		PageBean<MusicCustom> pageBean = musicService.findMusicByPage(currPage, musicQueryVo, null);
		model.addAttribute("pageBean", pageBean);
		return "houtai/Music/list";
	}

	@RequestMapping("/houtai/updateMusic")
	public String updateMusic(Integer id, MusicCustom musicCustom, Integer currPage) throws Exception {
		musicService.updateUser(id, musicCustom);
		return "forward:/houtai/findMusicListByPage.action?currPage=" + currPage;
	}

	@RequestMapping("/houtai/deleteMusicById")
	public String deleteMusicById(Integer id, Integer currPage) throws Exception {
		musicService.deleteMusicById(id);
		return "forward:/houtai/findMusicListByPage.action?currPage=" + currPage;
	}

	@RequestMapping("/houtai/deleteAllMusicById")
	public String deleteAllMusicById(Integer[] id, Integer currPage) throws Exception {
		for (int i = 0; i < id.length; i++) {
			musicService.deleteMusicById(id[i]);
		}
		return "forward:/houtai/findMusicListByPage.action?currPage=" + currPage;
	}

	@RequestMapping("findmusicbysinger")
	public String findmusicbysinger(MusicQueryVo musicQueryVo, Model model, Integer currPage) throws Exception {
		PageBean<MusicCustom> pageBean = musicService.findMusicByPage(currPage, musicQueryVo, 12);
		model.addAttribute("pageBean", pageBean);
		return "singer-detail";
	}

	@RequestMapping("upload")
	public void upload(MusicCustom musicCustom) throws Exception {
		List<MusicCustom> list = musicService.findMusic(musicCustom);
		if (list.size() == 0) {
			// 下载MP3歌曲
			if (musicCustom.getPath() != null || musicCustom.getPath() != "") {
				String downloadmp3 = PropertyUtil.getProperty("filegoldeurl")+"mp3\\" + musicCustom.getName() + ".mp3";
				FileRenameUtil.downloadFile(musicCustom.getPath(), downloadmp3);
				musicCustom.setPath("/upload/mp3/" + musicCustom.getName() + ".mp3");
			}
			// 下载图片
			if (musicCustom.getPhoto() != null || musicCustom.getPhoto() != "") {
				String photoname = FileRenameUtil.fileRename() + ".jpg";
				String downloadphoto = "D:\\upload\\photo\\" + photoname;
				FileRenameUtil.downloadFile(musicCustom.getPhoto(), downloadphoto);
				musicCustom.setPhoto("/upload/photo/" + photoname);
			}
			musicCustom.setNumber(0);
			musicService.addMusic(musicCustom);
		} else {
			update_number(list.get(0).getMusicid(), list.get(0));
		}
	}

	@RequestMapping("download")
	public ResponseEntity<byte[]> download(HttpServletRequest request, String filename) throws IOException {
		String realPath = "D:" + filename;// 获取下载文件的路径
		File file = new File(realPath);// 把下载文件构成一个文件处理 filename:前台传过来的文件名称

		HttpHeaders headers = new HttpHeaders();// 设置头信息
		String downloadFileName = new String(filename.getBytes("UTF-8"), "iso-8859-1");// 设置响应的文件名

		headers.setContentDispositionFormData("attachment", downloadFileName);
		headers.setContentType(MediaType.APPLICATION_OCTET_STREAM);

		// MediaType:互联网媒介类型 contentType：具体请求中的媒体类型信息
		return new ResponseEntity<byte[]>(FileUtils.readFileToByteArray(file), headers, HttpStatus.CREATED);
	}

	@RequestMapping("rank")
	public String rank(String term, Model model, Integer currPage) throws Exception {
		if (term == null)
			term = "number";
		PageBean<MusicCustom> pageBean = musicService.findMusicByRank(currPage, term, 10);
		model.addAttribute("pageBean", pageBean);
		model.addAttribute("term", term);
		return "rank";
	}

	@RequestMapping("update_number")
	public void update_number(Integer id, MusicCustom musicCustom) throws Exception {
		if (id != null) {
			musicCustom = musicService.selectMusicById(id);
			musicCustom.setNumber(musicCustom.getNumber() + 1);
			musicService.updateUser(id, musicCustom);
		}
	}

	@RequestMapping("rank_index_music")
	public String rank_index(HttpServletRequest request) throws Exception {
		PageBean<MusicCustom> pageBean_number = musicService.findMusicByRank(1, "number", 10);
		PageBean<MusicCustom> pageBean_musicid = musicService.findMusicByRank(1, "musicid", 5);
		HttpSession session=request.getSession();
		session.setAttribute("pageBean_number", pageBean_number);
		session.setAttribute("pageBean_musicid", pageBean_musicid);
		return "redirect:rank_index_songmenu.action";
	}
	
	@RequestMapping("music_message")
	public String music_message(Integer id,HttpServletRequest request) throws Exception {
		MusicCustom musicCustom=musicService.selectMusicById(id);
		HttpSession session=request.getSession();
		session.setAttribute("musicCustom", musicCustom);
		return "redirect:user_message.action?messageCustom.musicid="+id+"&&currPage=1&&messageCustom.reply=0";
	}
	@RequestMapping("mv_play")
	public String mv_play(Integer id,Model model) throws Exception {
		MusicCustom musicCustom=musicService.selectMusicById(id);
		model.addAttribute("musicCustom", musicCustom);
		return "mv";
	}
	@RequestMapping("/houtai/mv_upload")
	public String mv_upload(Integer id,MultipartFile file,Integer currPage) throws Exception {
		MusicCustom musicCustom=musicService.selectMusicById(id);
		if(!file.isEmpty())musicCustom=upload(file,musicCustom);
		musicService.updateUser(id, musicCustom);
		return "forward:/houtai/findMusicListByPage.action?currPage="+currPage;
	}
	// 文件上传
		public MusicCustom upload(MultipartFile file, MusicCustom musicCustom) {
			try {
				String name = file.getOriginalFilename();
				String fileName = FileRenameUtil.fileRename() + name.substring(name.indexOf("."));
				// String path = request.getServletContext().getRealPath("/upload/");
				String path = PropertyUtil.getProperty("filegoldeurl")+"mv\\";
				File f = new File(path, fileName);
				if (!f.exists())
					f.mkdirs();
				file.transferTo(f);
				System.out.println("上传成功");
				musicCustom.setMv("/upload/mv/" + fileName);
				return musicCustom;
			} catch (IllegalStateException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			return null;
		}
	
}
