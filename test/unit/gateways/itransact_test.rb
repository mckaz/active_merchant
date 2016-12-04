require 'test_helper'

class ItransactTest < Test::Unit::TestCase
  def setup
    @gateway = ItransactGateway.new(
                 :login => 'login',
                 :password => 'password',
                 :gateway_id => '09999'
               )

    @credit_card = credit_card
    @check = check
    @amount = 1014 # = $10.14
    
    @options = { 
      :email => 'name@domain.com',
      :order_id => '1',
      :billing_address => address,
      :description => 'Store Purchase',
      :email_text => ['line1', 'line2', 'line3']
    }
  end
  
  def test_successful_card_purchase
    @gateway.expects(:ssl_post).returns(successful_card_purchase_response)
    
    assert response = @gateway.purchase(@amount, @credit_card, @options)
    assert_instance_of Response, response
    assert_success response
    
    assert_equal '9999999999', response.authorization
    assert response.test?
  end

  def test_successful_check_purchase
    @gateway.expects(:ssl_post).returns(successful_check_purchase_response)

    assert response = @gateway.purchase(@amount, @credit_card, @options)
    assert_instance_of Response, response
    assert_success response

    assert response.success?
    assert response.test?
  end

  def test_unsuccessful_card_request
    @gateway.expects(:ssl_post).returns(failed_purchase_response)
    
    assert response = @gateway.purchase(@amount, @credit_card, @options)
    assert_failure response
    assert response.test?
  end

  ### MILOD'S TESTS

  def test_authorize
    response = @gateway.authorize(42, @credit_card, @options)
    assert response.test?
  end

  def test_purchase_refund_void_capture
    response = @gateway.purchase(42, @credit_card, {:billing_address => {}, :shipping_address => {:fake => "address"}, :order_items => [{:description => "blah", :cost => 42}]} )
    response2 = @gateway.refund(42, response.authorization)
    response3 = @gateway.void(response2.authorization)
    response4 = @gateway.capture(42, response3.authorization)
    assert response4.test?
  end

  def test_purchase_check
    assert response = @gateway.purchase(@amount, @credit_card, @options)
    check = Check.new(:account_type => "faketype", :routing_number => 123456, :account_number => 789, :first_name => "Billy", :last_name => "Bob" )
    response = @gateway.purchase(42, check, @options.update(:vendor_data => [["name", "key"]]) )
    assert_nil response.authorization
  end

  private
  
  def successful_card_purchase_response
    "<?xml version=\"1.0\" standalone=\"yes\"?>
<GatewayInterface><TransactionResponse><TransactionResult><Status>ok</Status><ErrorCategory></ErrorCategory><ErrorMessage></ErrorMessage><WarningMessage></WarningMessage><AuthCode></AuthCode><AVSCategory></AVSCategory><AVSResponse></AVSResponse><CVV2Response></CVV2Response><TimeStamp>20081216141214</TimeStamp><TestMode>TRUE</TestMode><Total>1.0</Total><XID>9999999999</XID><CustomerData><BillingAddress><Address1>1234 My Street</Address1><City>Ottawa</City><FirstName>Longbob</FirstName><LastName>Longsen</LastName><State>ON</State><Zip>K1C2N6</Zip><Country>CA</Country><Phone>(555)555-5555</Phone></BillingAddress><ShippingAddress><Address1></Address1><City></City><FirstName></FirstName><LastName></LastName><State></State><Zip></Zip><Country></Country><Phone></Phone></ShippingAddress></CustomerData></TransactionResult></TransactionResponse></GatewayInterface>"
  end
  
  def failed_purchase_response
    '<?xml version="1.0" standalone="yes"?>
<GatewayInterface><TransactionResponse><TransactionResult><Status>FAILED</Status><ErrorCategory>REQUEST_FORMAT</ErrorCategory><ErrorMessage>Form does not contain xml parameter</ErrorMessage><AuthCode></AuthCode><AVSCategory></AVSCategory><AVSResponse></AVSResponse><CVV2Response></CVV2Response><TimeStamp></TimeStamp><TestMode></TestMode><Total></Total><XID></XID><CustomerData><BillingAddress><Address1 /><City></City><FirstName></FirstName><LastName></LastName><State></State><Zip></Zip><Country></Country><Phone></Phone></BillingAddress><ShippingAddress><Address1></Address1><City></City><FirstName></FirstName><LastName></LastName><State></State><Zip></Zip><Country></Country><Phone></Phone></ShippingAddress></CustomerData></TransactionResult></TransactionResponse></GatewayInterface>'
  end

  def successful_check_purchase_response
    "<?xml version=\"1.0\" standalone=\"yes\"?>
<GatewayInterface><TransactionResponse><TransactionResult><Status>ok</Status><ErrorCategory></ErrorCategory><ErrorMessage></ErrorMessage><WarningMessage></WarningMessage><TimeStamp>20081216141214</TimeStamp><TestMode>TRUE</TestMode><Total>1.0</Total><XID>9999999999</XID><CustomerData><BillingAddress><Address1>1234 My Street</Address1><City>Ottawa</City><FirstName>Longbob</FirstName><LastName>Longsen</LastName><State>ON</State><Zip>K1C2N6</Zip><Country>CA</Country><Phone>(555)555-5555</Phone></BillingAddress><ShippingAddress><Address1></Address1><City></City><FirstName></FirstName><LastName></LastName><State></State><Zip></Zip><Country></Country><Phone></Phone></ShippingAddress></CustomerData></TransactionResult></TransactionResponse></GatewayInterface>"
  end

end
