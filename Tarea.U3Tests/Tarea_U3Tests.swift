//
//  Tarea_U3Tests.swift
//  Tarea.U3Tests
//
//  Created by herman vargas on 16-09-15.
//  Copyright (c) 2015 herman vargas. All rights reserved.
//

import UIKit
import XCTest
import Tarea_U3


class Tarea_U3Tests: XCTestCase {
    
    //var usuarios = Usuario.self;
    var lista:[String] = ["usuario4","usuario2","usuario10","usuario5","usuario4","usuario6","usuario7","usuario8","usuario9","usuario1"]

    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testExample() {
        // This is an example of a functional test case.
        //XCTAssert(true, "Pass")
        XCTAssert(Usuario(user: "usuario1", pass: "1234").validaVacio("", pass: ""),"Pass");
        // error
        //XCTAssert(Usuario(user: "usuario1", pass: "1234").validaVacio("Usuario1", pass: "1234"),"Pass");
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measureBlock() {
            // Put the code you want to measure the time of here.
           // println("\(String(Usuario.ordenarListado()))")
            //Usuario.ordenarListado();
           // usuarios.ordenarListado()
            
            
                
                //Usamos un bucle anidado
            for var i=0; i < self.lista.count-1; i++ {
                    for var j = i+1; j<self.lista.count; j++ {
                       // if (self.lista[i].compareToIgnoreCase(self.lista[j]) > 0) {
                         if (self.lista[i] == self.lista[j]) {
                            //Intercambiamos valores
                            var variableauxiliar = self.lista[i];
                            self.lista[i]=self.lista[j];
                            self.lista[j]=variableauxiliar;
                            
                        }
                    }
                }
            
            
            
            
            
            
            
            
            
            
        }
    }
    
}
