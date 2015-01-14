<?php
class ModelBankcodeBankcode extends Model {
		
		public function getBankCode() {
	//echo "-----";
			return array(
            array(
                'id' => "10",
                'name' => "ICICI Bank"
            ),
			 array(
                'id' => "50",
                'name' => "Axis Bank"
            ),
			 array(
                'id' => "120",
                'name' => "Corporation Bank"
            ),
			 array(
                'id' => "130",
                'name' => "Yes Bank"
            ),
			 array(
                'id' => "140",
                'name' => "Karnataka Bank"
            ),
			 array(
                'id' => "160",
                'name' => "Oriental Bank of Commerce"
            ),
			 array(
                'id' => "240",
                'name' => "Bank of India"
            ),
			 array(
                'id' => "750",
                'name' => "Bank of Maharashtra"
            ),
			 array(
                'id' => "180",
                'name' => "South Indian Bank"
            ),
			 array(
                'id' => "200",
                'name' => "Vijaya Bank"
            ),
			 array(
                'id' => "270",
                'name' => "Federal Bank"
            ),
			 array(
                'id' => "310",
                'name' => "Bank of Baroda"
            ),
			 array(
                'id' => "340",
                'name' => "Bank of Bahrain and Kuwait"
            ),
			 array(
                'id' => "370",
                'name' => "Dhanlaxmi Bank"
            ),
			 array(
                'id' => "330",
                'name' => "Deutsche Bank"
            ),
			 array(
                'id' => "190",
                'name' => "Union Bank of India"
            ),
			 array(
                'id' => "420",
                'name' => "Indian Overseas Bank"
            ),
			 array(
                'id' => "280",
                'name' => "Allahabad Bank"
            ),
			 array(
                'id' => "300",
                'name' => "HDFC Bank"
            ),
			 array(
                'id' => "230",
                'name' => "Citi Bank"
            ),
			 array(
                'id' => "520",
                'name' => "IDBI Bank"
            ),
			 array(
                'id' => "530",
                'name' => "State Bank of India"
            ),
			 array(
                'id' => "440",
                'name' => "City Union Bank"
            ),
			 array(
                'id' => "450",
                'name' => "Standard Chartered Bank"
            ),
			 array(
                'id' => "350",
                'name' => "J and K Bank"
            ),
			 array(
                'id' => "550",
                'name' => "State Bank of Mysore"
            ),
			 array(
                'id' => "560",
                'name' => "State Bank of Hyderabad"
            ),
			 array(
                'id' => "490",
                'name' => "Indian Bank"
            ),
			 array(
                'id' => "620",
                'name' => "Tamilnad Mercantile Bank"
            ),
			 array(
                'id' => "540",
                'name' => "Development Credit Bank"
            ),
			 array(
                'id' => "680",
                'name' => "State Bank of Travencore"
            ),
			 array(
                'id' => "570",
                'name' => "United Bank of India"
            ),
			 array(
                'id' => "760",
                'name' => "Karur Vysya Bank"
            )
        );			
		}	
	
	
 public function getBrokingBankCode()
    {
        return array(
            array(
                'id' => "210",
                'name' => "HDFC Bank Broking"
            ),
			 array(
                'id' => "510",
                'name' => "IDBI Bank Broking"
            ),
			 array(
                'id' => "360",
                'name' => "J and K Bank Broking"
            ),
			 array(
                'id' => "610",
                'name' => "SBI Broking"
            ),
			 array(
                'id' => "400",
                'name' => "Yes Bank"
            ),
			 array(
                'id' => "480",
                'name' => "ICICI Broking"
            ),
			 array(
                'id' => "660",
                'name' => "Axis Bank Broking"
            )
        );
    }
	
 public function getCashBankCode()
    {
        return array(
            array(
                'id' => "460",
                'name' => "I-Cash Card "
            ),
			 array(
                'id' => "320",
                'name' => "Beam Cash Card"
            )
        );
    }	
	
	
	 public function getCcBankCode()
    {
        return array(
           array(
                'id' => "70",
                'name' => "VISA Credit Card / Debit Card on SKBMart"
            ),
			 array(
                'id' => "390",
                'name' => "CitiBank Gateway (VISA/MasterCard/Diners)"
            ),
			 array(
                'id' => "290",
                'name' => "HDFC Credit Card Gateway (VISA/MasterCard)"
            ),
			 array(
                'id' => "500",
                'name' => "IDBI Bank Credit Card"
            ),
			 array(
                'id' => "670",
                'name' => "VISA / MasterCard / Maestro"
            )
			 
        );
    }
	
	public function getCorpBankCode()
    {
        return array(
           array(
                'id' => "720",
                'name' => "ICICI Corporate Bank"
            )
        );
    }
	
	
	public function getMerchantProperties() {
	
		$MerchantProperties=array(
				"txtBillerId"=>"L1870",
				"txtResponseUrl"=>"http://www.skbmart.com/index.php?route=payment/tpsl/callback",
				//"txtResponseUrl"=>"http://www.skbmart.com/catalog/controller/payment/Response.php",
				"txtCRN"=>"INR",
				"txtCheckSumKey"=>"8429252207KTFVBK",
				"tpslUrl"=>"https://www.tpsl-india.in/PaymentGateway/TransactionRequest.jsp",
				"CheckSumGenUrl"=>"https://www.tpsl-india.in/PaymentGateway/CheckSumRequest");
				return $MerchantProperties;	
	}	
	
	
}
?>