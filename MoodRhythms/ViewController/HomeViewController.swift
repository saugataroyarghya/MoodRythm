//
//  HomeViewController.swift
//  MoodRhythms
//
//  Created by kuet on 12/11/23.
//

import UIKit
import FirebaseAuth
import FirebaseFirestore

class HomeViewController: UIViewController,UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet var songss: UILabel!
    
    @IBOutlet var table: UITableView!
    var receivedWeatherData: WeatherData? // Property to hold received WeatherData
    var songs = [Song]()
    
    
    @IBOutlet weak var weather: UIButton!
    @IBOutlet weak var logout: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        songss.text = "\(receivedWeatherData!.current.condition.text)"
        
        
        
        if ("\(receivedWeatherData!.current.condition.text)" == "Sunny"){
            configureSongs1()
            
        }
        else if ("\(receivedWeatherData!.current.condition.text)" == "Rainy"){
            
            configureSongs2()
        }
        
        else {
            configureSongs3()
        }
       
        table.delegate = self
        table.dataSource = self

        // Do any additional setup after loading the view.
    }
    
    ///var weatherCheck:String = Condition.text;
    func configureSongs1(){
        songs.append(Song(name: "Lovely", albumName:"KIll BILL", artistName: "Bilie Illish", imageName: "cover9", trackName: "song9"))
        songs.append(Song(name: "November Rain", albumName:"Slash", artistName: "Guns N Roses", imageName: "cover10", trackName: "song10"))
        songs.append(Song(name: "Suger", albumName:"Over Exposed", artistName: "Maroon 5", imageName: "cover11", trackName: "song11"))
        songs.append(Song(name: "After Hours", albumName:"Save Your Tears", artistName: "The Weekend", imageName: "cover4", trackName: "song4"))
        
        songs.append(Song(name: "Knee Shocks", albumName:"Dominno", artistName: "Artic Monkey", imageName: "cover5", trackName: "song5"))
        songs.append(Song(name: "Shake It Off", albumName:"1989", artistName: "Taylor Swift", imageName: "cover6", trackName: "song6"))
        
        songs.append(Song(name: "Let Her Go", albumName:"All The Little Lights", artistName: "Passenger", imageName: "cover7", trackName: "song7"))
        songs.append(Song(name: "Carolina", albumName:"1889", artistName: "Taylor Swift", imageName: "cover8", trackName: "song8"))
        
        
//
    }
    func configureSongs2(){
//
        songs.append(Song(name: "Fix You", albumName:"Lost", artistName: "coldplay", imageName: "cover9", trackName: "song9"))
        songs.append(Song(name: "City Lights", albumName:"something", artistName: "Metropoliton", imageName: "cover10", trackName: "song10"))
        songs.append(Song(name: "Moon Light", albumName:"Nockternal", artistName: "Starry", imageName: "cover11", trackName: "song11"))
        
        songs.append(Song(name: "Echo", albumName:"Timeless", artistName: "Eternal", imageName: "cover12", trackName: "song12"))
        songs.append(Song(name: "Celestial", albumName:"Heavenly", artistName: "Cosmic", imageName: "cover2", trackName: "song2"))
        
        songs.append(Song(name: "Wisper", albumName:"Gentle", artistName: "Trio", imageName: "cover4", trackName: "song4"))
        songs.append(Song(name: "Hermony", albumName:"Palette", artistName: "Seasonal Fan", imageName: "cover5", trackName: "song5"))
        songs.append(Song(name: "Rythm", albumName:"Jungle", artistName: "Groove", imageName: "cover6", trackName: "song6"))
        songs.append(Song(name: "Urban", albumName:"City Escape", artistName: "Metro", imageName: "cover7", trackName: "song7"))
        
       
    }
    
    func configureSongs3(){
        
        songs.append(Song(name: "Golden", albumName:"Sunset", artistName: "Horizon", imageName: "cover8", trackName: "song8"))
        songs.append(Song(name: "Silent", albumName:"Mistic", artistName: "Enigmetic", imageName: "cover9", trackName: "song9"))
        songs.append(Song(name: "Etheral", albumName:"Dream", artistName: "Celestial", imageName: "cover10", trackName: "song10"))
        songs.append(Song(name: "Journey", albumName:"Cosmic", artistName: "Infinite", imageName: "cover11", trackName: "song11"))
        songs.append(Song(name: "Lost", albumName:"Escapade", artistName: "Hermony", imageName: "cover12", trackName: "song12"))
        songs.append(Song(name: "Whispering Pines", albumName:"Sonata", artistName: "Ensemble", imageName: "cover1", trackName: "song1"))
        songs.append(Song(name: "Urban", albumName:"Native", artistName: "Breaking Benjamine", imageName: "cover5", trackName: "song5"))
        songs.append(Song(name: "Rain Drop", albumName:"Rainy", artistName: "Droplet", imageName: "cover6", trackName: "song6"))
        songs.append(Song(name: "Mosaic", albumName:"City", artistName: "Metro", imageName: "cover7", trackName: "song7"))
        songs.append(Song(name: "reverie", albumName:"Horizon", artistName: "Explorer", imageName: "cover8", trackName: "song8"))
        songs.append(Song(name: "AdnanArghoSwopnilAbtahe", albumName:"KuetHill", artistName: "Soummo", imageName: "cover3", trackName: "song3"))
        
        
       
    }
    

    //Table
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       return songs.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        let song = songs[indexPath.row]
        // configure
        cell.textLabel?.text = song.name
        cell.detailTextLabel?.text = song.albumName
        cell.accessoryType = .disclosureIndicator
        cell.imageView?.image = UIImage(named: song.imageName)
        
        
        cell.textLabel?.font = UIFont(name: "Helvetica-Bold", size: 18)
        cell.detailTextLabel?.font = UIFont(name: "Helvetica", size: 17)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 100
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        // present  the player
        let position = indexPath.row
        //songs
        guard let vc = storyboard?.instantiateViewController(withIdentifier: "player") as? PlayerViewController else {
            return
        }
        
        vc.songs = songs
        vc.position = position
        present(vc , animated: true)
    }
   
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

    @IBAction func weatherTapped(_ sender: Any) {
    }
    @IBAction func logoutTapped(_ sender: Any) {
        do {
            try Auth.auth().signOut()
transitionToHome()
            
        } catch {
            print("Error signing out: \(error.localizedDescription)")
            // Handle error if necessary
        }    }
    func transitionToHome() {
        let ViewController = storyboard?.instantiateViewController(withIdentifier: Constants.Storyboard.ViewController) as? ViewController
        view.window?.rootViewController = ViewController
        view.window?.makeKeyAndVisible()
    }
}

struct Song {
    let name: String
    let albumName: String
    let artistName: String
    let imageName: String
    let trackName: String
}
