`timescale 1ns / 1ps

module decoderbasedLPM(B,A1,A0,so);

        input [7:0] B;
         input  A0;
         input A1;
        output [8:0] so;
     
   
        wire NB0,NB1,aB,Ab,AB,ap8,ap81,k1,a2,a3,a4,a5;            // always defined
     
  
        //Decoder part
        not X(NB0,A0);
        not Y(NB1,A1);
        and Ak(aB,NB1,A0);
        and Ak1(Ab,A1,NB0);
        and Ak2(AB,A1,A0);
    
   //s0
        
            and aIk0(a3,aB,B[0]);
                and akI0(a4,AB,B[0]);
                or akk0(so[0],a3,a4);
      //calculation of p7 till p1
  //s1
             and ak(k1,aB,B[1]);
             and aI(a2,AB,B[1]);
             and aIk(a31,AB,B[0]);
             and akI(a41,Ab,B[0]);
             or akk(so[1],k1,a2,a31,a41);
             
   //s2
                and ak1(k12,aB,B[2]);
   and aI1(a22,AB,B[2]);
   and aIk1(a32,AB,B[1]);
   and akI1(a42,Ab,B[1]);
   or akk1(so[2],k12,a22,a32,a42);
//s3
     and ak2(k13,aB,B[3]);
        and aI2(a23,AB,B[3]);
        and aIk2(a33,AB,B[2]);
        and akI2(a43,Ab,B[2]);
        or akk2(so[3],k13,a23,a33,a43);
//s4
            and ak3(k14,aB,B[4]);
        and aI3(a24,AB,B[4]);
        and aIk3(a34,AB,B[3]);
        and akI3(a44,Ab,B[3]);
        or akk3(so[4],k14,a24,a34,a44);
//s5    
     and ak4(k15,aB,B[5]);
        and aI4(a25,AB,B[5]);
        and aIk4(a35,AB,B[4]);
        and akI4(a45,Ab,B[4]);
        or akk4(so[5],k15,a25,a35,a45);
//s6
     and ak5(k16,aB,B[6]);
        and aI5(a26,AB,B[6]);
        and aIk5(a36,AB,B[5]);
        and akI5(a46,Ab,B[5]);
        or akk5(so[6],k16,a26,a36,a46);
//s7
     and ak6(k17,aB,B[7]);
        and aI6(a27,AB,B[7]);
        and aIk6(a37,AB,B[6]);
        and akI6(a47,Ab,B[6]);
        or akk6(so[7],k17,a27,a37,a47);
//s8

    and aIk7(a38,Ab,B[7]);
        and akI7(a48,AB,B[7]);
        or akk7(so[8],a38,a48);
             
 endmodule
       
