//
//  ViewController.swift
//  Tarea.U3
//
//  Created by herman vargas on 16-09-15.
//  Copyright (c) 2015 herman vargas. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
   
    @IBOutlet weak var lblUsuario: UILabel!
    
    
    @IBOutlet weak var lblLista: UITextView!
    
    //var usuarios: [[String]] = [["Juan10","Tai helao1","123456"],["Juan2","Tai helao2","123456"],["Juan3","Tai helao3","123456"],["Juan4","Tai helao4","123456"],["Juan5","Tai helao5","123456"],["Juan6","Tai helao6","123456"],["Juan7","Tai helao7","123456"],["Juan8","Tai helao8","123456"], ["Juan9","Tai helao9","123456"],["Juan1","Tai helao10","123456"]];
    var usuarios = ["usuario4","usuario2","usuario10","usuario5","usuario4","usuario6","usuario7","usuario8","usuario9","usuario1"];
 
    var Resultado:String = ""
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        for (usuario) in usuarios{
        
            Resultado += String(stringInterpolationSegment: usuario);
        }
        lblLista.text = "\(Resultado)";
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    // cuando se carga la vista  se valida si está logeado o no (contra la caché)
    
    override func viewDidAppear(animated: Bool) {
       
        // creamos un objeto de tipo NSUserDefaults prefs (caché) que guardará si el usuario está logueado o no
        let prefs:NSUserDefaults = NSUserDefaults.standardUserDefaults()
        // generamos una constante de tipo int leyendo de NSUserDefaults ISLOGGEDIN
        let isLoggedIn:Int = prefs.integerForKey("ISLOGGEDIN") as Int
        
        // si no está logeado, envía a la vista de login, sino muestra el nombre de usuario, leido de la caché
        if (isLoggedIn != 1) {
            self.performSegueWithIdentifier("irAlogin", sender: self)
        } else {
            self.lblUsuario.text = prefs.valueForKey("USERNAME") as? String
        }
        
    }
    // La función cerrar borrar todos los datos de la caché y devuelve al login
    
    func ordenar(){
       
        var ordenados: () = sort(&usuarios, <)
        lblLista.text = ("\(usuarios)");
    
    }
   
    @IBAction func btnOrdenar(sender: UIButton) {
        
        ordenar()
        
        //var ordenados: () = sort(&usuarios, <)
        //lblLista.text = ("\(usuarios)");
        
    }
    
    
    @IBAction func cerrar(sender: UIButton) {
        
        
        let appDomain = NSBundle.mainBundle().bundleIdentifier
        
        NSUserDefaults.standardUserDefaults().removePersistentDomainForName(appDomain!)
        
         self.performSegueWithIdentifier("irAlogin", sender: self)
        
    }

}

