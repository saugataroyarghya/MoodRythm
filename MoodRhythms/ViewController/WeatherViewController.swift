//
//  WeatherViewController.swift
//  MoodRhythms
//
//  Created by kuet on 23/11/23.
//

import UIKit

class WeatherViewController: UIViewController {
    
    @IBOutlet var updatetimeLabel: UILabel!
    @IBOutlet var regionLabel: UILabel!
    @IBOutlet var countryLabel: UILabel!
    @IBOutlet var temperatureLabel: UILabel!
    @IBOutlet var windLabel: UILabel!
    @IBOutlet var humidityLabel: UILabel!
    
    @IBOutlet var refreshData: UIButton!
    
    @IBOutlet var imageview: UIImageView!
    
    @IBOutlet var conditionLabel: UILabel!
    var fullWeatherData: WeatherData?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchData()

        // Do any additional setup after loading the view.
    }
   
    func fetchData( )
   {
       let url = URL(string: "https://api.weatherapi.com/v1/current.json?key=61af11bba9124212baf85419232611&q=bangladesh&aqi=no")
       let dataTask = URLSession.shared.dataTask(with: url!, completionHandler: {
           (data, response, error) in
           guard let data = data, error == nil else
           {
               print("Error")
               return
           }
          // var fullWeatherData:WeatherData?
           do
           {
               self.fullWeatherData = try JSONDecoder().decode(WeatherData.self, from: data)
               
           }
           catch
           {
               print("Error")

               
           }
           
           DispatchQueue.main.async {
               if let weatherData = self.fullWeatherData {
                                   self.updatetimeLabel.text = "\(weatherData.current.last_updated)"
                                   self.regionLabel.text = "\(weatherData.location.region)"
                                   self.countryLabel.text = "\(weatherData.location.country)"
                                   self.conditionLabel.text = "\(weatherData.current.condition.text)"
                                   self.temperatureLabel.text = "\(weatherData.current.temp_c)°C"
                                   self.humidityLabel.text = "Humidity : \(weatherData.current.humidity)"
                                   self.windLabel.text = "\(weatherData.current.wind_kph) Km/Hr"
                                   if let iconURL = URL(string: "https:\(weatherData.current.condition.icon)") {
                                       if let imageData = try? Data(contentsOf: iconURL) {
                                           self.imageview.image = UIImage(data: imageData)
                                       }
                                   }
                               }
                           }
                       })
                       dataTask.resume()
   }
    

    @IBAction func refreshData(_ sender: Any) {
        fetchData()
    }
    
    
    @IBAction func suggestSongs(_ sender: Any) {
        guard let homeViewController = storyboard?.instantiateViewController(withIdentifier: Constants.Storyboard.homeViewController) as? HomeViewController else {
                    return
                }
                homeViewController.receivedWeatherData = fullWeatherData
                view.window?.rootViewController = homeViewController
                view.window?.makeKeyAndVisible()
        
    }
  
    
//        override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//            if segue.identifier == "Songs" {
//                if let HomeVC = segue.destination as? HomeViewController {
//                    // Pass the string from the text field to the second view controller
//                    //
//                }
//            }
//        }
    
    
    

}
