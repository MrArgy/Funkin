package fmf.songs;



//this class with manager songs data
class SongManager
{


	static public var songs:Array<SongData> = 
	[
//-------------------------TUTORIAL--------------------------
		new SongData
		(
			{
				folder: 'week_tutorial',
				character: '',
				songTitle: 'How to Funk',
				songList: ['Tutorial']
			}
		),
//-----------------------------------------------------------

//-------------------------DADDY DEAREST---------------------

		// new SongData
		// (
		// 	{
		// 		folder: 'week_matt',
		// 		character: 'matt',
		// 		songTitle: 'Matt',
		// 		songList: ['Light-it-up', 'Ruckus', 'Target-Practicle']
		// 	}
		// ),
		new SongData
		(
			{
				folder: 'week_agoti',
				character: 'agoti',
				songTitle: 'A.G.O.T.I',
				songList: ['Screenplay', 'Parasite', 'AGOTI', "Guns"]
			}
		),

		new SongData
		(
			{
				folder: 'week_whitty',
				character: 'whitty',
				songTitle: 'Whitty',
				songList: ['Lo-fight', 'Overhead', 'Ballistic', "Remorse"]
			}
		),
		

	];
//-----------------------------------------------------------


}