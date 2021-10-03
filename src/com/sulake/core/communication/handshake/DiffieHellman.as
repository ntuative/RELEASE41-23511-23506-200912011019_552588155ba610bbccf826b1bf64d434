package com.sulake.core.communication.handshake
{
   import com.hurlant.math.BigInteger;
   
   public class DiffieHellman implements IKeyExchange
   {
       
      
      private var var_1390:BigInteger;
      
      private var var_981:BigInteger;
      
      private var var_1809:BigInteger;
      
      private var var_1389:BigInteger;
      
      private var var_1810:BigInteger;
      
      private var var_1811:BigInteger;
      
      public function DiffieHellman(param1:BigInteger, param2:BigInteger)
      {
         super();
         var_1390 = param1;
         var_1809 = param2;
      }
      
      public function getSharedKey(param1:uint = 16) : String
      {
         return var_1810.toRadix(param1);
      }
      
      public function generateSharedKey(param1:String, param2:uint = 16) : String
      {
         var_1389 = new BigInteger();
         var_1389.fromRadix(param1,param2);
         var_1810 = var_1389.modPow(var_981,var_1390);
         return getSharedKey(param2);
      }
      
      public function getPublicKey(param1:uint = 16) : String
      {
         return var_1811.toRadix(param1);
      }
      
      public function init(param1:String, param2:uint = 16) : Boolean
      {
         var_981 = new BigInteger();
         var_981.fromRadix(param1,param2);
         var_1811 = var_1809.modPow(var_981,var_1390);
         return true;
      }
   }
}
