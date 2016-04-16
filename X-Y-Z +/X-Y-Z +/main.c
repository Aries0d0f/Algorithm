//
//  main.c
//  X-Y-Z +
//
//  Created by Aries on 2016/4/13.
//  Copyright © 2016年 Aries. All rights reserved.
//

#include <stdio.h>
#include <stdlib.h>


int i,j;
int E[3][4];
int x,y,z,X,Y,Z;
int temp[4];
int feeback,ans;
double deltaA[2],deltaB[2],deltaC[2],deltaD[2];
int LinX,LinY,LinZ,N1,N2;


int main(){
    
    for(i=0;i<3;i++){
        printf("請輸入平面方程式E%d=ax+by+cz=d\n",i+1);
        for(j=0;j<4;j++){
            
            scanf("%d",&E[i][j]);
        }
    }
    
    
    //克拉瑪公式
    x = E[0][0] * (E[1][1]*E[2][2]-E[1][2]*E[2][1]);
    y = E[1][0] * (E[0][1]*E[2][2]-E[0][2]*E[2][1]);
    z = E[2][0] * (E[0][1]*E[1][2]-E[0][2]*E[1][1]);
    temp[0] = (x-y+z);
    
    
    
    x = E[0][3] * (E[1][1]*E[2][2]-E[1][2]*E[2][1]);
    y = E[1][3] * (E[0][1]*E[2][2]-E[0][2]*E[2][1]);
    z = E[2][3] * (E[0][1]*E[1][2]-E[0][2]*E[1][1]);
    temp[1] = (x-y+z);
    
    
    
    x = E[0][0] * (E[1][3]*E[2][2]-E[1][2]*E[2][3]);
    y = E[1][0] * (E[0][3]*E[2][2]-E[0][2]*E[2][3]);
    z = E[2][0] * (E[0][3]*E[1][2]-E[0][2]*E[1][3]);
    temp[2] = (x-y+z);
    
    
    
    x = E[0][0] * (E[1][1]*E[2][3]-E[1][3]*E[2][1]);
    y = E[1][0] * (E[0][1]*E[2][3]-E[0][3]*E[2][1]);
    z = E[2][0] * (E[0][1]*E[1][3]-E[0][3]*E[1][1]);
    temp[3] = (x-y+z);
    
    
    
    //判斷Delta是否為0
    if(temp[0] != 0){
        //Yes
        
        feeback = 1;//回傳有解，進入有解運算式
        X = temp[1]/temp[0];
        Y = temp[2]/temp[0];
        Z = temp[3]/temp[0];
    }else{
        //No
        
        //計算比值
        deltaA[0] = E[0][0]/E[1][0];
        deltaB[0] = E[0][1]/E[1][1];
        deltaC[0] = E[0][2]/E[1][2];
        deltaD[0] = E[0][3]/E[1][3];
        deltaA[1] = E[1][0]/E[2][0];
        deltaB[1] = E[1][1]/E[2][1];
        deltaC[1] = E[1][2]/E[2][2];
        deltaD[1] = E[1][3]/E[2][3];
        
        //判斷DeltaX,DeltaY,DeltaZ
        if((temp[1]&&temp[2]&&temp[3]) == 0){
            //Yes
            
            feeback = 2;
        }else{
            //No
            
            feeback = 0;//DeltaX,DeltaY,DeltaZ其一不為0;導向至無解判斷式
        }
    }
    //判斷區
    for(i=0;i<2;i++){
        for(j=0;j<2;j++){
            
            //無解判斷式
            if(feeback == 0){
                if((deltaA[i]==deltaB[i]==deltaC[i]!=deltaD[i])&&(deltaA[j]==deltaB[j]==deltaC[j]!=deltaD[j])){
                    //Yes
                    //輸出答案(兩平面平行且與另一平面兩兩交一線，無解)
                    
                    ans = 2 ;
                }else{
                    //No
                    //輸出答案(三平面兩兩交一線，無解)
                    ans = 1 ;
                    
                }
            }
            //有解運算式
            if(feeback == 1){
                
                ans = 3 ;
                
            }
            //無限多解＆無解判斷
            
            //是否重合判斷
            if(feeback == 2){
                
                
                //是否有重合機率判斷
                if((deltaA[i]==deltaB[i]==deltaC[i]==deltaD[i])||(deltaA[j]==deltaB[j]==deltaC[j]==deltaD[j])){
                    //是，引導至平行判斷
                    feeback = 3;
                    
                }else{
                    
                    //否，輸出答案（三平面完全平行，無解）
                    
                    ans = 6 ;
                    
                }
            }
            
            
            
            //平行判斷
            
            if(feeback == 3){
                //是否平行判斷
                if((deltaA[i]==deltaB[i]==deltaC[i]!=deltaD[i])&&(deltaA[j]==deltaB[j]==deltaC[j]!=deltaD[j])){
                    //是，引導至無解判斷
                    feeback = 4;
                }else if((deltaA[i]==deltaB[i]==deltaC[i]==deltaD[i])&&(deltaA[j]==deltaB[j]==deltaC[j]==deltaD[j])){
                    //否，輸出答案（兩面重合與一面平行，無解）
                    ans = 4 ;
                }else{
                    ans = 5 ;
                }
            }
            
            //無限多解判斷
            
            if(feeback == 4){
                //是否其中有重合可能
                if(((deltaA[i]==deltaA[j])&&(deltaB[i]==deltaB[j])&&(deltaC[i]==deltaC[j]))||(!(deltaA[i]==deltaA[j])&&(deltaB[i]==deltaB[j]))||((deltaC[i]&&deltaC[j]))){
                    //是，引導至是否完全重合判斷
                    feeback = 5;
                }else{
                    //否，輸出答案(三面交一線，無限多解)
                    ans = 7 ;
                }
            }
            
            
            //重和方式判斷
            
            if(feeback == 5){
                //是否完全重合判斷
                if((deltaA[i]==deltaA[j])&&(deltaB[i]==deltaB[j])&&(deltaC[i]==deltaC[j])){
                    
                    //是，輸出答案（三面平行，無解）
                    ans = 6 ;
                }else{
                    //否，輸出答案（兩面重合與一面交一線，無限多解）
                    ans = 8 ;
                }
            }
        }
    }
    
    
    
    //答案輸出
    if(ans ==1){
        printf("三平面兩兩交一線，無解\n");
    }
    if(ans ==2){
        printf("兩平面平行且與另一平面兩兩交一線，無解\n");
    }
    if(ans ==3){
        printf("三平面交一點且恰有一解(%d,%d,%d)\n",X,Y,Z);
    }
    if(ans ==4){
        printf("三平面完全重合，無解\n");
    }
    if(ans ==5){
        printf("兩面重合與一面平行，無解\n");
    }
    if(ans ==6){
        printf("三面完全平行，無解\n");
    }
    if(ans ==7){
        printf("三面交一線，無限多解\n");
    }
    if(ans ==8){
        printf("兩面重合與一面交一線，無限多解\n");//於%dx+%dy+%dz=%d
    }
    
    
}