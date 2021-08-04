package fmf.songs;

import fmf.characters.Littleman;
import flixel.FlxG;


//this class will handle which SongPlayer should be play
class SongPlayerManager
{
	public static function getPcId():Int
	{
		var pcId:Int = FlxG.save.data.pcId;
		return pcId;
	}
	public static function getCurrentSong(songName:String):SongPlayer
	{
		var songPlayer:SongPlayer = new Tutorial('gf');

		switch (songName.toLowerCase())
		{
			case 'tutorial':
				songPlayer = new Tutorial('gf');

			case 'bopeebo' | 'fresh' | 'dadbattle' | 'dad battle' | 'dad-battle':
				songPlayer = new DaddyDearest("dad");

			case 'spookeez' | 'south':
				songPlayer = new Spookez("spooky");

			case 'monster':
				songPlayer = new Monster("monster");

			case 'pico' | 'philly' | 'blammed' | 'philly nice' |  'philly-nice' | 'phillynice':
				songPlayer = new Philly("pico");

			case 'satin-panties' | "high" | "milf"  | 'satin panties' | 'satinpanties':
				songPlayer = new Mom("mom");

			case 'cocoa' | 'eggnog':
				songPlayer = new Parents("parents");

			case 'winter-horrorland' | 'winter horrorland' | 'winterhorrorland':
				songPlayer = new WinterHorrorland("monster-christmas");

			case 'senpai':
				songPlayer = new Senpai("school");

			case 'roses':
				songPlayer = new SenpaiAngry("school");

			case 'thorns':
				songPlayer = new SenpaiEvil("school");

			case 'light-it-up' | 'ruckus':
				songPlayer = new Matt("matt");

			case 'lo-fight' | 'overhead':
				songPlayer = new Whitty('whitty');

			case 'ballistic':
				songPlayer = new Ballistic('ballistic');

			case 'remorse':
				songPlayer = new Remorse('remorse');

			case 'screenplay' | 'parasite' | 'guns':
				songPlayer = new Agoti("agoti");

			case 'agoti':
				songPlayer = new AgotiCrazy("agoti-crazy");

			case 'eeeaaaooo':
				songPlayer = new Eeeeaaaooo("tf");

			case 'target-practice':
				songPlayer = new TargetPractice("target-practice");

			case 'foolhardy':
				songPlayer = new Foolhardy("foolhardy");

			case 'manifest':
				songPlayer = new Manifest('sky');

			case 'incident':
				songPlayer = new Incident();

			case 'improbable-outset':
				songPlayer = new TrickyMask();
			
			case 'madness':
				songPlayer = new Tricky();
			
			case 'hellclown':
				songPlayer = new TrickyHell();

			case 'expurgation':
				songPlayer = new TrickyEx();

			case 'reality-bender':
				songPlayer = new TrickyBen();

			case 'wocky' | 'beathoven':
				songPlayer = new Kapi();

			case 'nyaw':
				songPlayer = new KapiAngry();

			case 'flatzone':
				songPlayer = new KapiFan();

			case 'run':
				songPlayer = new Run();

			case 'headache':
				songPlayer = new Garcello();

			case 'nerves':
				songPlayer = new GarcelloTired();

			case 'release':
				songPlayer = new GarcelloDead();
			
			case 'fading':
				songPlayer = new GarcelloGhosty();

			case 'my-battle' | 'last-chance':
				songPlayer = new Tabi();

			case 'genocide':
				songPlayer = new TabiMad();

			case 'little-man':
				songPlayer = new BobSmall();
		}

		// songPlayer = new Eeeeaaaooo("ye");

		return songPlayer;
	}

}