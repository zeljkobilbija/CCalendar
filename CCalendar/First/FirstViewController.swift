//
//  FirstViewController.swift
//  CCalendar
//
//  Created by Zeljko Bilbija on 05/11/17.
//  Copyright © 2017 Zeljko Bilbija. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController {
    
    //MARK: -
    //MARK: GLOBALNE PROMENLJIVE
    
    var menuVidljiv = false
    var picker: MojPicker!
    let lokal = Locale(identifier: Locale.preferredLanguages[0])
    //let datum = Date()
    var globalniPickerCalendar: Calendar!
    var globalniDatum = Date()
    
    
    //MARK: -
    //MARK: MAIN VIEW OUTLETS
    
    
    //Constrain OUTLET
    @IBOutlet weak var LidingConstrain: NSLayoutConstraint!
    
    //SELECTOVANI CALENDAR label
    @IBOutlet weak var prviLabel: MojLabel!
    
    //GODINA Label
    @IBOutlet weak var drugiLabel: MojLabel!
    
    //MESEC label
    @IBOutlet weak var treciLabel: MojLabel!
    
    @IBOutlet weak var datumView: DesignView!
    
    
    //Image View
    @IBOutlet weak var imageView: MojImage!
    
    //DAN U NEDELJI label
    @IBOutlet weak var cetvrtiLabel: MojLabel!
    
    //DATUM label
    @IBOutlet weak var petiLabel: MojLabel!
    
    //DONJIU DATUM label
    @IBOutlet weak var sestiLabel: MojLabel!
    
    //DONJI KALENDAR_IME label
    @IBOutlet weak var sedmiLabel: MojLabel!
    
    
     //MARK: -
    //MARK: MENU VIEW OUTLETS AND ACTIONS
 
    @IBOutlet weak var menuView: GradientView!
    
    //SELECT CALENDAR Label
    @IBOutlet weak var selectcalendarlabel: MojLabel!
    
    @IBOutlet weak var menuPicker: MojPicker!
    
   
    //MARK: -
    //MARK: IBACTION
    
    @IBAction func OKButtonMenuView(_ sender: MojButton)
    {
        
        LidingConstrain.constant = -310
        UIView.animate(withDuration: 0.3, animations:
            {
                self.view.layoutIfNeeded()
        })
        
        menuVidljiv = !menuVidljiv
    }
    
    

    
    //NAVIGATION BAR
    
    @IBAction func navBarButton(_ sender: UIBarButtonItem)
    {
        
        if (menuVidljiv)
        {
            LidingConstrain.constant = -310
            UIView.animate(withDuration: 0.3, animations:
                {
                    self.view.layoutIfNeeded()
            })
        }else{
            LidingConstrain.constant = 0
            UIView.animate(withDuration: 0.3, animations:
                {
                    self.view.layoutIfNeeded()
            })
        }
        menuVidljiv = !menuVidljiv
    }

    //MARK: -

     /****************************************************************/
    // MARK: VIEW DID LOAD
    /****************************************************************/
    
    override func viewDidLoad() {
        super.viewDidLoad()
     
        picker = MojPicker()
        picker.pickerovModelPodataka = Podatci.getDate()
        
        menuPicker.dataSource = picker
        menuPicker.delegate = picker
        
        menuView.layer.shadowOpacity = 1
        menuView.layer.shadowRadius = 6
        
        globalniPickerCalendar = picker.pickerovModelPodataka[menuPicker.selectedRow(inComponent: 0)].CCkalendar

        
        title = picker.pickerovModelPodataka[menuPicker.selectedRow(inComponent: 0)].CCNazivKalendara
        
        prviLabel.text = picker.pickerovModelPodataka[menuPicker.selectedRow(inComponent: 0)].CCNazivKalendara
        
        drugiLabel.text = FormatizovaniDatum().lokalizovanaFormatizovanaStringa(kalendar: picker.pickerovModelPodataka[menuPicker.selectedRow(inComponent: 0)].CCkalendar,segmentDatuma: .GODINA, datum: datum)
        
        treciLabel.text = FormatizovaniDatum().lokalizovanaFormatizovanaStringa(kalendar: picker.pickerovModelPodataka[menuPicker.selectedRow(inComponent: 0)].CCkalendar , segmentDatuma: .NAZIV_MESECA, datum: datum)
        
        cetvrtiLabel.text = FormatizovaniDatum().lokalizovanaFormatizovanaStringa(kalendar: picker.pickerovModelPodataka[menuPicker.selectedRow(inComponent: 0)].CCkalendar, segmentDatuma: .NAZIV_DANA, datum: datum)
        
        petiLabel.text = FormatizovaniDatum().lokalizovanaFormatizovanaStringa(kalendar: picker.pickerovModelPodataka[menuPicker.selectedRow(inComponent: 0)].CCkalendar, segmentDatuma: .DATUM, datum: datum)
        
        
        sestiLabel.text = FormatizovaniDatum().lokalizovanaFormatizovanaStringa(kalendar: Locale.autoupdatingCurrent.calendar,  segmentDatuma: .FULL, datum: datum).capitalized(with: lokal)

        sedmiLabel.text = lokal.localizedString(for: Locale.autoupdatingCurrent.calendar.identifier)?.capitalized(with: lokal)

        
        //Tekst na MenuView labelu-Select calendar
        selectcalendarlabel.text = selectCalendarString
    

        //MARK: SWIPE ACTIONS
        
        let leviSwipe = UISwipeGestureRecognizer(target: self, action: #selector(leftSwipeAction(swipe:)))
        leviSwipe.direction = UISwipeGestureRecognizerDirection.left
        self.view.addGestureRecognizer(leviSwipe)

        let desniSwipe = UISwipeGestureRecognizer(target: self, action: #selector(desniSwipe(swipe:)))
        desniSwipe.direction = UISwipeGestureRecognizerDirection.right
        self.view.addGestureRecognizer(desniSwipe)

        let duplitap = UITapGestureRecognizer(target: self, action: #selector(dupliTap(swipe:)))
        duplitap.numberOfTapsRequired = 2
        self.view.addGestureRecognizer(duplitap)

    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
      
    }
    
    override func viewWillAppear(_ animated: Bool) {
        //Notifikacija za Picker i njegovu promenu
        NotificationCenter.default.addObserver(self, selector: #selector(mojNotifikacijskiMetod), name: .mojPickerDidChange, object: nil)
        
        //Notifikacija mza update current calendara za datum i ime calendara
        NotificationCenter.default.addObserver(self, selector: #selector(aplikacijaCePostatiVidljiva), name: .applicacijaWillEnterForeground  , object: nil)

        navigationController?.setNavigationBarHidden(false, animated: true)
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)

        navigationController?.setNavigationBarHidden(true, animated: false)
    }
    
    //MARK: -

    //MARK: NOTIFIKACIJA
    
    @objc func mojNotifikacijskiMetod()
    {
        prviLabel.text = picker.pickerovModelPodataka[menuPicker.selectedRow(inComponent: 0)].CCNazivKalendara
        
        drugiLabel.text = FormatizovaniDatum().lokalizovanaFormatizovanaStringa(kalendar: picker.pickerovModelPodataka[menuPicker.selectedRow(inComponent: 0)].CCkalendar, segmentDatuma: .GODINA, datum: datum)
        
        treciLabel.text = FormatizovaniDatum().lokalizovanaFormatizovanaStringa(kalendar: picker.pickerovModelPodataka[menuPicker.selectedRow(inComponent: 0)].CCkalendar , segmentDatuma: .NAZIV_MESECA, datum: datum)
        
        cetvrtiLabel.text = FormatizovaniDatum().lokalizovanaFormatizovanaStringa(kalendar: picker.pickerovModelPodataka[menuPicker.selectedRow(inComponent: 0)].CCkalendar,segmentDatuma: .NAZIV_DANA, datum: datum)
        
        petiLabel.text = FormatizovaniDatum().lokalizovanaFormatizovanaStringa(kalendar: picker.pickerovModelPodataka[menuPicker.selectedRow(inComponent: 0)].CCkalendar, segmentDatuma: .DATUM, datum: datum)
        
        title = picker.pickerovModelPodataka[menuPicker.selectedRow(inComponent: 0)].CCNazivKalendara
        
        globalniPickerCalendar = picker.pickerovModelPodataka[menuPicker.selectedRow(inComponent: 0)].CCkalendar

    }
    
  @objc func aplikacijaCePostatiVidljiva()
  {
    sestiLabel.text = FormatizovaniDatum().lokalizovanaFormatizovanaStringa(kalendar: Locale.autoupdatingCurrent.calendar,  segmentDatuma: .FULL, datum: datum).capitalized(with: lokal)
    
    sedmiLabel.text = lokal.localizedString(for: Locale.autoupdatingCurrent.calendar.identifier)?.capitalized(with: lokal)
    }
    
    
    //MARK: -

    //MARK: SWIPE ACTIONS
    
       /**********************       SWIPE ACTIONS       ****************************/
    
    @objc   func leftSwipeAction(swipe: UISwipeGestureRecognizer )
    {
//        let lokal = Locale(identifier: Locale.preferredLanguages[0])

//        var datekomponents = DateComponents()
//        datekomponents.day = 1
//        let formater = DateFormatter()
//        formater.calendar = globalniPickerCalendar
//        formater.dateStyle = .full
//        formater.locale = lokal
//
//        let globalniDatum = globalniPickerCalendar.date(byAdding: datekomponents, to: datum)
//        //globalniDatum = noviDatum!
//
//        petiLabel.text = FormatizovaniDatum().formatizovanaStringa(kalendar: picker.pickerovModelPodataka[menuPicker.selectedRow(inComponent: 0)].CCkalendar, segmentDatuma: .DATUM, datum: globalniDatum!)
        
                UIView.transition(with: datumView, duration: 0.6, options:[ .transitionFlipFromRight, .curveEaseInOut ]  , animations: nil, completion: nil)
        
    }
    
    @objc    func desniSwipe(swipe: UISwipeGestureRecognizer)
    {
        
                UIView.transition(with: datumView, duration: 0.6, options:[ .transitionFlipFromLeft, .curveEaseInOut ]  , animations: nil, completion: nil)
        
    }
    
    @objc  func dupliTap(swipe: UITapGestureRecognizer)
    {
        
               UIView.transition(with: datumView, duration: 0.6, options:[ .transitionFlipFromBottom, .curveEaseInOut, .beginFromCurrentState ]  , animations: nil, completion: nil)
    }

    //MARK: -



}

