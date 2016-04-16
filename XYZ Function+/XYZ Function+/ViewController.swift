//
//  ViewController.swift
//  XYZ Function+
//
//  Created by Aries on 2016/4/14.
//  Copyright © 2016年 Aries. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {
    
    

    @IBOutlet weak var OutPut: UILabel!

    
    @IBOutlet weak var a1: UITextField!
    
    @IBOutlet weak var a2: UITextField!
    
    @IBOutlet weak var a3: UITextField!
    
    @IBOutlet weak var b1: UITextField!
    
    @IBOutlet weak var b2: UITextField!
    
    @IBOutlet weak var b3: UITextField!
    
    @IBOutlet weak var c1: UITextField!
    
    @IBOutlet weak var c2: UITextField!
    
    @IBOutlet weak var c3: UITextField!
    
    @IBOutlet weak var d1: UITextField!
    
    @IBOutlet weak var d2: UITextField!
    
    @IBOutlet weak var d3: UITextField!
    
    
    var textFields:[UITextField] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.a1.delegate = self
        self.a2.delegate = self
        self.a3.delegate = self
        self.b1.delegate = self
        self.b2.delegate = self
        self.b3.delegate = self
        self.c1.delegate = self
        self.c2.delegate = self
        self.c3.delegate = self
        self.d1.delegate = self
        self.d2.delegate = self
        self.d3.delegate = self
        
        textFields = [a1,a2,a3,b1,b2,b3,c1,c2,c3,d1,d2,d3]
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
        
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        
        var currentTextField = textFields[0]
        
        if (currentTextField == textField) {
            currentTextField = textFields[1]
            currentTextField.becomeFirstResponder()
        } else {
            currentTextField.resignFirstResponder()
            a1.text = "StartProcess"
            a2.text = "StartProcess"
            a3.text = "StartProcess"
            b1.text = "StartProcess"
            b2.text = "StartProcess"
            b3.text = "StartProcess"
            c1.text = "StartProcess"
            c2.text = "StartProcess"
            c3.text = "StartProcess"
            OutPut.text = "StartProcess"
            
        }
        return true
    }
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        self.view.endEditing(true)
        
        super.touchesBegan(touches, withEvent:event)
    }
    
    @IBAction func StartProcess(sender: UIButton) {
        
        OutPut.text = "請先在下方輸入方程式"
        
        var temp = [4]
        var feeback = 0
        var ans = 0
        var (X,Y,Z) = (0,0,0)
        
        var deltaA = [2]
        var deltaB = [2]
        var deltaC = [2]
        var deltaD = [2]
        
        var deltaPar = [8]
        
        var x,y,z: Int
        
        

        let A1: Int? = Int(self.a1.text! as String)!
        let A2: Int? = Int(self.a2.text! as String)!
        let A3: Int? = Int(self.a3.text! as String)!
        
        let B1: Int? = Int(self.b1.text! as String)!
        let B2: Int? = Int(self.b2.text! as String)!
        let B3: Int? = Int(self.b3.text! as String)!
        
        let C1: Int? = Int(self.c1.text! as String)!
        let C2: Int? = Int(self.c2.text! as String)!
        let C3: Int? = Int(self.c3.text! as String)!
        
        let D1: Int? = Int(self.d1.text! as String)!
        let D2: Int? = Int(self.d2.text! as String)!
        let D3: Int? = Int(self.d3.text! as String)!
        
        /*
        let A1: Int = Int(A1t!)
        let A2: Int = Int(A2t!)
        let A3: Int = Int(A3t!)
        
        let B1: Int = Int(B1t!)
        let B2: Int = Int(B2t!)
        let B3: Int = Int(B3t!)
        
        let C1: Int = Int(C1t!)
        let C2: Int = Int(C2t!)
        let C3: Int = Int(C3t!)
        
        let D1: Int = Int(D1t!)
        let D2: Int = Int(D2t!)
        let D3: Int = Int(D3t!)
        */
        
        x = A1! * (B2! * C3! - C2! * B2!)
        y = B1! * (B1! * C3! - A3! * C1!)
        z = C1! * (A2! * B3! - A3! * B2!)
        temp[0] = (x-y+z);
        
        
        
        x = D1! * (B2! * C3! - C2! * B2!)
        y = B1! * (B1! * C3! - D3! * C1!)
        z = C1! * (D2! * B3! - D3! * B2!)
        temp[1] = (x-y+z);
        
        
        
        x = A1! * (D2! * C3! - C2! * D2!)
        y = D1! * (D1! * C3! - A3! * C1!)
        z = C1! * (A2! * D3! - A3! * D2!)
        temp[2] = (x-y+z);
        
        
        
        x = A1! * (B2! * D3! - D2! * B2!)
        y = B1! * (B1! * D3! - A3! * D1!)
        z = D1! * (A2! * B3! - A3! * B2!)
        temp[3] = (x-y+z);
        
        
        
        
        
        if temp[0] == 0 {
            feeback = 1
            X = temp[1]/temp[0]
            Y = temp[2]/temp[0]
            Z = temp[3]/temp[0]
            
        }else{
            if (temp[1] | temp[2] | temp[3]) == 0 {
                feeback = 0
            }else{
                feeback = 2
            }
            
        }
   
        
        deltaA[0] = A1!/A2!
        deltaB[0] = B1!/B2!
        deltaC[0] = C1!/C2!
        deltaD[0] = D1!/D2!
        deltaA[1] = A2!/A3!
        deltaB[1] = B2!/B3!
        deltaC[1] = C2!/C3!
        deltaD[1] = D2!/D3!
        
        deltaPar[0] = deltaA[0]
        deltaPar[1] = deltaA[1]
        deltaPar[2] = deltaB[0]
        deltaPar[3] = deltaB[1]
        deltaPar[4] = deltaC[0]
        deltaPar[5] = deltaC[1]
        deltaPar[6] = deltaD[0]
        deltaPar[7] = deltaD[1]
        
        
        
        let parChA_B = deltaPar[0] | deltaPar[1] == deltaPar[2] | deltaPar[3] ? true : false
        let parChB_C = deltaPar[2] | deltaPar[3] == deltaPar[4] | deltaPar[5] ? true : false
        let parChA_C = deltaPar[0] | deltaPar[1] == deltaPar[4] | deltaPar[5] ? true : false
        let sam_D = deltaPar[6] == deltaPar[7] ? true : false
        
        let parFA_B = deltaPar[0] & deltaPar[1] == deltaPar[2] & deltaPar[3] ? true : false
        let parFB_C = deltaPar[2] & deltaPar[3] == deltaPar[4] & deltaPar[5] ? true : false
        let parFA_C = deltaPar[0] & deltaPar[1] == deltaPar[4] & deltaPar[5] ? true : false
        
        let par = parChA_B && parChA_C && parChB_C && !sam_D ? true : false
        let parF = parFA_B && parFB_C && parFA_C && !sam_D ? true : false
        
        let sam = par && sam_D ? true : false
        let samF = parF && sam_D ? true : false
        
        
        //判斷DeltaX,DeltaY,DeltaZ
        if temp[1] | temp[2] | temp[3] != 0 {
            //Yes
            
            feeback = 0//DeltaX,DeltaY,DeltaZ其一不為0;導向至無限多解判斷式
        }else{
            //No
            
            feeback = 2
        }
 
    //判斷區
    //for var i in 0 ..< 2 {
        //for var j in 0 ..< 2 {
            
            
    
            //無解判斷式
            if feeback == 0 {
                //平行判斷
                if par {
                    //Yes
                    //輸出答案(兩平面平行且與另一平面兩兩交一線，無解)
    
                    ans = 2
                }else{
                    //No
                    //輸出答案(三平面兩兩交一線，無解)
                    ans = 1
    
                }
            }
            //有解運算式
            if feeback == 1 {
    
                ans = 3
    
            }
            //無限多解＆無解判斷
    
            //是否完全平行判斷
            if feeback == 2 {
    
    
                //是否有重合機率判斷
                if sam {
                    //是，引導至平行判斷
                    feeback = 3;
    
                }else{
    
                    //否，輸出答案（三平面完全平行，無解）
    
                    ans = 6 ;
                    
                }
            }

    
    
            //平行判斷
    
            if feeback == 3 {
                //是否平行判斷
                if par {
                    //是，引導至無解判斷
                    feeback = 4;
                }else if samF {
    
                    ans = 4 ;
                }else{
                    //否，輸出答案（兩面重合與一面平行，無解）
                    ans = 5 ;
                }
            }
    
            //無解判斷
    
            if feeback == 4 {
                //是否其中有重合可能
                if sam {
                    //是，引導至是否完全重合判斷
                    feeback = 5;
                }else{
                    //否，輸出答案(三面交一線，無限多解)
                    ans = 7 ;
                }
            }
    
            //無限多解判斷
            //重和方式判斷
    
            if feeback == 5 {
                //是否完全重合判斷
                if samF {
    
                    //是，輸出答案（三面平行，無解）
                    ans = 6 ;
                }else{
                    //否，輸出答案（兩面重合與一面交一線，無限多解）
                    ans = 8 ;
                }
            }
        //}
    //}

    
    
    
            //答案輸出
            if ans == 1 {
                //printIn(三平面兩兩交一線，無解)
                OutPut.text = "三平面兩兩交一線，無解"
            }
            if ans == 2 {
                //printf("兩平面平行且與另一平面兩兩交一線，無解\n");
                OutPut.text = "兩平面平行且與另一平面兩兩交一線，無解"
    
            }
            if ans == 3{
                //printf("三平面交一點且恰有一解(%d,%d,%d)\n",X,Y,Z);
                OutPut.text = "三平面交一點且恰有一解（\(X),\(Y),\(Z)）"
    
            }
            if ans == 4 {
                //printf("三平面完全重合，無解\n");
                OutPut.text = "三平面完全重合，無解"
    
    
            }
            if ans == 5 {
                //printf("兩面重合與一面平行，無解\n");
                OutPut.text = "兩面重合與一面平行，無解"
    
            }
            if ans == 6 {
                //printf("三面完全平行，無解\n");
                OutPut.text = "三面完全平行，無解"
    
            }
            if ans == 7 {
                //printf("三面交一線，無限多解\n");
                OutPut.text = "三面交一線，無限多解"
    
            }
            if ans == 8 {
                //printf("兩面重合與一面交一線，無限多解\n");//於%dx+%dy+%dz=%d
                OutPut.text = "兩面重合與一面交一線，無限多解"
                
            }

        
 
        
    }
    
}