
import UIKit

class SharePaymentView: UIViewController {

    
    @IBOutlet weak var TableView_out: UITableView!
    
    
    
    var animals : [String : [String]] =
    ["B" : ["Bear", "Black Swan", "Buffalo"],
        "C" : ["Camel", "Cockatoo"],
        "D" : ["Dog", "Donkey"],
        "E" : ["Emu"],
        "G" : ["Giraffe", "Greater Rhea"],
        "H" : ["Hippopotamus", "Horse"],
        "K" : ["Koala"],
        "L" : ["Lion", "Llama"],
        "M" : ["Manatus", "Meerkat"],
        "P" : ["Panda", "Peacock", "Pig", "Platypus", "Polar Bear"],
        "R" : ["Rhinoceros"],
        "S" : ["Seagull"],
        "T" : ["Tasmania Devil"],
        "W" : ["Whale", "Whale Shark", "Wombat"]]

    var animalSectionTitles:NSArray = []
    var animalSection = [String]()
    var rev = [String]()
    var ns = []
    var is_searching:Bool = false
    var searchingDataArray:NSMutableArray = []
    var DataArry:NSMutableArray = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        animalSection = animals.keys.array
        rev  = sorted(animalSection, { (s1, s2) -> Bool in
            return s1 <= s2
        })
        println(rev)
        
        ns = rev

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
       
    }
    
    func numberOfSectionsInTableView(tableView: UITableView)-> Int {
        
        return animalSection.count
        
    }
    
    func tableView(tableView: UITableView,numberOfRowsInSection section: Int)-> Int {
        
        
            var sectionTitle = rev[section]   // String
            var sectionAnimals : [String] = animals[sectionTitle]! // String Array
            return sectionAnimals.count
        
        
    }
    
    func tableView(tableView: UITableView,cellForRowAtIndexPath indexPath: NSIndexPath)-> UITableViewCell {
        
        let cell:SharePaymentCell = tableView.dequeueReusableCellWithIdentifier("SharePaymentCell", forIndexPath: indexPath) as! SharePaymentCell
        
        
            var sectionTitle = rev[indexPath.section]
            var sectionAnimals : [String] = animals[sectionTitle]!
            var animal = sectionAnimals[indexPath.row]
            
            DataArry.addObject(sectionAnimals[indexPath.row])
           // println("dataArry==>\(DataArry)")
        
            cell.UserNamelbl.text = animal
        
        return cell
    }
    func tableView(tableView: UITableView,titleForHeaderInSection section: Int)-> String? {
        
        
        return rev[section]
        
    }
    func sectionIndexTitlesForTableView(tableView: UITableView)-> [AnyObject] {
        
        TableView_out.sectionIndexBackgroundColor = UIColor.clearColor()

        var animalIndexTitles = ["A ", "B ", "C ", "D ", "E ", "F ", "G ", "H ", "I ", "J ", "K ", "L ", "M ", "N ", "O ", "P ", "Q ", "R ", "S ", "T ", "U ", "V ", "W ", "X ", "Y ", "Z ","# "];
        
        
        return animalIndexTitles
    }
    func tableView(tableView: UITableView,sectionForSectionIndexTitle title: String,atIndex index: Int)-> Int {
        
        return ns.indexOfObject(title)
        
        // return self.animalSection.indexOfObject(title)
        
    }

}
