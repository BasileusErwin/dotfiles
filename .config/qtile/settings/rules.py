from libqtile import layout
from libqtile.config import Match

def rules(group=[], floating=False, layout_floating={}):
	if not floating:
			return {
					" ": Match(wm_class=["Brave-browser"]),
					" ": Match(wm_class=[""]),
					" ": Match(wm_class=[""]),
					" ": Match(wm_class=["firefox"]),
					" ": Match(wm_class=["Thunar", "pcmanfm"]),
					" ": Match(wm_class=["stacer", "Zoom"]),
					" ": Match(wm_class=[
						"TelegramDesktop", 
						"whatsapp-nativerfier-d402011", 
						"Thunderbird", 
						"discord"
						]),
					" ": Match(wm_class=["spotify"]),
					" ": Match(wm_class=["Slack"])
			}[group]
	elif floating:
		return [
      *layout_floating,
			Match(wm_class='confirmreset'),  # gitk
			Match(wm_class='makebranch'),  # gitk
			Match(wm_class='maketag'),  # gitk
			Match(wm_class='ssh-askpass'),  # ssh-askpass
			Match(title='branchdialog'),  # gitk
			Match(wm_class='wpa_gui'),
			Match(wm_class='SpeedCrunch'),
			Match(wm_class='Nitrogen'),
			Match(wm_class='Lxappearance'),
			Match(wm_class='Zathura'),
			Match(wm_class='pavucontrol'),
			Match(wm_class='pulseaudio-equalizer-gtk'),
			Match(wm_class='Piper'),
			Match(wm_class='firefox', wm_type='Dialog'),
			Match(wm_class='firefox', wm_type='Places'),
			Match(wm_class='Brave-browser', wm_type='Places'),
			Match(wm_class='Brave-browser', wm_type='Dialog'),
			Match(wm_class='Thunar', wm_type='Dialog'),
		]
		