#!/bin/bash 

# payflow_express.rb
sed -i '' '133s/SetExpressCheckout/DoExpressCheckout/' lib/active_merchant/billing/gateways/payflow_express.rb
sed -i '' '160s/options\[:comment\] unless options\[:comment\]\.nil?/42/' lib/active_merchant/billing/gateways/payflow_express.rb
# payu_latam.rb
sed -i '' '280s/raw_response/""/' lib/active_merchant/billing/gateways/payu_latam.rb
sed -i '' '259s/order\[:id\] = order_id/post.update :hi => 2/' lib/active_merchant/billing/gateways/payu_latam.rb
sed -i '' '274s/post/#/' lib/active_merchant/billing/gateways/payu_latam.rb
# blue_pay.rb
sed -i '' '382s/merchant/fail/' lib/active_merchant/billing/gateways/blue_pay.rb
sed -i '' '364s/test?/false/' lib/active_merchant/billing/gateways/blue_pay.rb
# itransact.rb
sed -i '' '390s/test?/false/' lib/active_merchant/billing/gateways/itransact.rb
sed -i '' '391s/response\[:xid\]/"9999999999"/' lib/active_merchant/billing/gateways/itransact.rb
# trans_first_transaction_express.rb
sed -i '' '338s/message/"faulty",#/' lib/active_merchant/billing/gateways/trans_first_transaction_express.rb
sed -i '' '341s/authorization_/"faulty",#/' lib/active_merchant/billing/gateways/trans_first_transaction_express.rb
# migs.rb
sed -i '' '105s/commit/nil#/' lib/active_merchant/billing/gateways/migs.rb
sed -i '' '116s/commit/nil#/' lib/active_merchant/billing/gateways/migs.rb
sed -i '' '89s/commit/nil#/' lib/active_merchant/billing/gateways/migs.rb
sed -i '' '139s/commit/nil#/' lib/active_merchant/billing/gateways/migs.rb
sed -i '' '176s/?/!/' lib/active_merchant/billing/gateways/migs.rb
# trust_commerce.rb
sed -i '' '223s/commit/nil#/' lib/active_merchant/billing/gateways/trust_commerce.rb
sed -i '' '292s/commit/nil#/' lib/active_merchant/billing/gateways/trust_commerce.rb
# nab_transact.rb
sed -i '' '245s/test?/false/' lib/active_merchant/billing/gateways/nab_transact.rb
sed -i '' '246s/authorization_/false/' lib/active_merchant/billing/gateways/nab_transact.rb
# payflow.rb
sed -i '' '100s/build_reference/nil#/' lib/active_merchant/billing/gateways/payflow.rb
# conekta.rb
sed -i '' '204s/raw_/42#/' lib/active_merchant/billing/gateways/conekta.rb
# netbilling.rb
sed -i '' '94s/commit/nil#/' lib/active_merchant/billing/gateways/netbilling.rb
# quantum.rb
sed -i '' '64s/commit/nil#/' lib/active_merchant/billing/gateways/quantum.rb
# mercury.rb
sed -i '' '76s/commit/nil#/' lib/active_merchant/billing/gateways/mercury.rb
# sage_pay.rb
sed -i '' '156s/commit/nil#/' lib/active_merchant/billing/gateways/sage_pay.rb
# beanstream/beanstream_core.rb
sed -i '' '105s/commit/nil#/' lib/active_merchant/billing/gateways/beanstream/beanstream_core.rb
# element.rb
sed -i '' '110s/commit/nil#/' lib/active_merchant/billing/gateways/element.rb
# authorize_net_arb.rb
sed -i '' '208s/options/42)#/' lib/active_merchant/billing/gateways/authorize_net_arb.rb
# efsnet.rb
sed -i '' '74s/commit/nil#/' lib/active_merchant/billing/gateways/efsnet.rb
# smart_ps.rb
sed -i '' '114s/commit/nil#/' lib/active_merchant/billing/gateways/smart_ps.rb
# cardknox.rb
sed -i '' '96s/commit/nil#/' lib/active_merchant/billing/gateways/cardknox.rb
# garanti.rb
sed -i '' '51s/commit/nil#/' lib/active_merchant/billing/gateways/garanti.rb
# payway.rb
sed -i '' '143s/commit/nil#/' lib/active_merchant/billing/gateways/payway.rb
# metrics_global.rb
sed -i '' '115s/commit/nil#/' lib/active_merchant/billing/gateways/metrics_global.rb
# inspire.rb
sed -i '' '89s/commit/nil#/' lib/active_merchant/billing/gateways/inspire.rb
# webpay.rb
sed -i '' '66s/commit/nil#/' lib/active_merchant/billing/gateways/webpay.rb
# datacash.rb
sed -i '' '63s/commit/nil#/' lib/active_merchant/billing/gateways/data_cash.rb
# elavon.rb
sed -i '' '183s/commit/nil#/' lib/active_merchant/billing/gateways/elavon.rb


