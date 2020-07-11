package com.xu.ssm.po;

public class SongListCustom extends SongList {
	private Music music;
	private SongMenu songmenu;
	public Music getMusic() {
		return music;
	}
	public void setMusic(Music music) {
		this.music = music;
	}
	public SongMenu getSongmenu() {
		return songmenu;
	}
	public void setSongmenu(SongMenu songmenu) {
		this.songmenu = songmenu;
	}
	
}
