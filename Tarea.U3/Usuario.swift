//
//  Usuario.swift
//  Tarea.U3
//
//  Created by herman vargas on 13-10-15.
//  Copyright (c) 2015 herman vargas. All rights reserved.
//

import Foundation

public class Usuario{

    private var user:String
    private var pass:String
    
  //  var usuarios:[String] = ["usuario4","usuario2","usuario10","usuario5","usuario4","usuario6","usuario7","usuario8","usuario9","usuario1"];
    
    public init(user:String, pass:String){
    
        self.user = user
        self.pass = pass
    }
    public func getUser()->String{
        return user
    }
    public func getPass()->String{
        return pass
    }
    public func validaVacio(user:String, pass:String)->Bool{
    
        if(user.isEmpty || pass.isEmpty){
            return true
        }else{
            return false
        }
    }
    
   /* public func ordenarListado()-> String{
            var ordenados: () = sort(&usuarios, <)
            return ("\(usuarios)")
    } */

}