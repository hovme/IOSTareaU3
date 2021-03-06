//
//  loginViewController.swift
//  Tarea.U3
//
//  Created by herman vargas on 16-09-15.
//  Copyright (c) 2015 herman vargas. All rights reserved.
//

import UIKit

class loginViewController: UIViewController {

    
    
    @IBOutlet weak var usuario: UITextField!
    
    
    
    @IBOutlet weak var contrasena: UITextField!
    
    
   
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    @IBAction func btnAcceder(sender: UIButton) {
        
        
        
        
        var user:NSString = usuario.text
        var pass: NSString = contrasena.text
        
        
        
        if(user.isEqualToString("") || pass.isEqualToString("")){
            
            var alertView:UIAlertView = UIAlertView()
            alertView.title = "Acceso incorrecto!"
            alertView.message = "Ingrese las credenciales correctas"
            alertView.delegate = self
            alertView.addButtonWithTitle("Aceptar")
            alertView.show()
            
        }else{
            // se mete el user y pass dentro de un string
            var post:NSString = "username=\(user)&password=\(pass)"
            
            // mandamos al log para ir registrando lo que va pasando
            NSLog("PostData: %@",post);
            
            // llamamos a la URl donde está el json que se conectará con la BD
            var url:NSURL = NSURL(string: "http://betatest.cl/jsonlogin2.php")!
            
            // codificamos lo que se envía
            var postData:NSData = post.dataUsingEncoding(NSASCIIStringEncoding)!
            
            // se determina el largo del string
            var postLength:NSString = String( postData.length )
            
            // componemos la URL con una var request y un NSMutableURLRequest y le pasamos como parámetros las vars
            var request:NSMutableURLRequest = NSMutableURLRequest(URL: url)
            request.HTTPMethod = "POST"
            request.HTTPBody = postData
            request.setValue(postLength as String, forHTTPHeaderField: "Content-Length")
            request.setValue("application/x-www-form-urlencoded", forHTTPHeaderField: "Content-Type")
            request.setValue("application/json", forHTTPHeaderField: "Accept")
            
            
            var reponseError: NSError?
            var response: NSURLResponse?
            
            // hacemos la conexion
            var urlData: NSData? = NSURLConnection.sendSynchronousRequest(request, returningResponse:&response, error:&reponseError)
            
            // se valida
            if ( urlData != nil ) {
                let res = response as! NSHTTPURLResponse!;
                
                NSLog("Response code: %ld", res.statusCode);
                
                if (res.statusCode >= 200 && res.statusCode < 300)
                {
                    var responseData:NSString  = NSString(data:urlData!, encoding:NSUTF8StringEncoding)!
                    
                    NSLog("Response ==> %@", responseData);
                    
                    var error: NSError?
                    
                    let jsonData:NSDictionary = NSJSONSerialization.JSONObjectWithData(urlData!, options:NSJSONReadingOptions.MutableContainers , error: &error) as! NSDictionary
                    
                    // obtenemos de json el valor success y lo tratamos cono int
                    let success:NSInteger = jsonData.valueForKey("success") as! NSInteger
                    
                    //[jsonData[@"success"] integerValue];
                    
                    // registramos en el log si está correcto el acceso
                    
                    NSLog("Success: %ld", success);
                    
                    if(success == 1)
                    {
                        NSLog("Login SUCCESS");
                        // guardamos en la caché
                        var prefs:NSUserDefaults = NSUserDefaults.standardUserDefaults()
                        // tomamos el nombre de usuario y lo guardamos
                        prefs.setObject(user, forKey: "USERNAME")
                        // también si está logeado
                        prefs.setInteger(1, forKey: "ISLOGGEDIN")
                        // se sincroniza
                        prefs.synchronize()
                        
                        self.dismissViewControllerAnimated(true, completion: nil)
                    } else {
                        var error_msg:NSString
                        
                        if jsonData["error_message"] as? NSString != nil {
                            error_msg = jsonData["error_message"] as! NSString
                        } else {
                            error_msg = "Error desconocido"
                        }
                        var alertView:UIAlertView = UIAlertView()
                        alertView.title = "Acceso incorrecto"
                        alertView.message = error_msg as String
                        alertView.delegate = self
                        alertView.addButtonWithTitle("OK")
                        alertView.show()
                        
                    }
                    
                } else {
                    var alertView:UIAlertView = UIAlertView()
                    alertView.title = "Acceso incorrecto"
                    alertView.message = "Conneción Fallida"
                    alertView.delegate = self
                    alertView.addButtonWithTitle("OK")
                    alertView.show()
                }
            } else {
                var alertView:UIAlertView = UIAlertView()
                alertView.title = "Acceso incorrecto"
                alertView.message = "Conneción Fallida"
                if let error = reponseError {
                    alertView.message = (error.localizedDescription)
                }
                alertView.delegate = self
                alertView.addButtonWithTitle("OK")
                alertView.show()
            }
            
            
        }
        
        
    }

    // funcion que la que limpiamos los campos de texto
    
    @IBAction func limpiar(sender: UIButton) {
        
        var user:NSString = usuario.text
        var pass: NSString = contrasena.text
                
        
        if((user !== "") || (pass !== "")){
        
            usuario.text = ""
            contrasena.text = ""
        
        }
        
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
