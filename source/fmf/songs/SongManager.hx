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
				folder: 'week_whitty',
				character: 'whitty',
				songTitle: 'Whitty',
				songList: ['Remorse', 'Overhead', 'Ballistic']
			}
		),
		

	];
//-----------------------------------------------------------


}