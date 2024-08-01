package company.tap.google.pay.internal

import androidx.annotation.RestrictTo
import company.tap.google.pay.open.enums.AllowedMethods
import company.tap.google.pay.open.enums.SDKMode
import java.math.BigDecimal
@RestrictTo(RestrictTo.Scope.LIBRARY)
object PaymentDataSource : company.tap.google.pay.internal.interfaces.PaymentDataSource {
    private var currency: String? = null
    private var amount: BigDecimal? = null
    private lateinit var gatewayMerchantId: String
    private lateinit var gatewayId: String
    private lateinit var sdkMode: SDKMode
    private lateinit var allowedMethods: AllowedMethods
   // private lateinit var allowedCardNetworks: ArrayList<String>
    private var allowedCardNetworks: MutableList<String>? = java.util.ArrayList()
    private lateinit var countryCode: String
    /**
     * Set transaction currency.
     *
     * @param transactionCurrency the tap currency
     */
    fun setTransactionCurrency(transactionCurrency: String) {
        currency = transactionCurrency
    }
    /**
     * Set amount.
     *
     * @param amount the amount
     */
    fun setAmount(amount: BigDecimal?) {
        this.amount = amount
    }
    fun setEnvironmentMode(sdkMode: SDKMode) {
        this.sdkMode = sdkMode
    }

    fun setGatewayId(gatewayId: String) {
        this.gatewayId = gatewayId
    }
    fun setGatewayMerchantId(gatewayMerchantId: String) {
        this.gatewayMerchantId = gatewayMerchantId
    }
    fun setAllowedCardNetworks(allowedCardNetworks: MutableList<String>?) {
        this.allowedCardNetworks = allowedCardNetworks
    }

    fun setAllowedCardAuthMethods(allowedMethods: AllowedMethods) {
        this.allowedMethods = allowedMethods
    }

    fun setCountryCode(countryCode: String) {
        this.countryCode = countryCode
    }
//////////////////////////////Getters///////////////////////
    override fun getCurrency(): String? {
        return currency
    }

    override fun getAmount(): BigDecimal? {
        return amount
    }

    override fun getEnvironment(): SDKMode? {
       return sdkMode
    }

    override fun getAllowedCardMethod(): AllowedMethods {
      return allowedMethods
    }

    override fun getAllowedNetworks(): MutableList<String>? {
        return allowedCardNetworks
    }

    override fun getGatewayId(): String {
       return gatewayId
    }

    override fun getGatewayMerchantId(): String {
        return if(::gatewayMerchantId.isInitialized)
            gatewayMerchantId
        else ""
    }

    override fun getCountryCode(): String {
       return countryCode
    }
}