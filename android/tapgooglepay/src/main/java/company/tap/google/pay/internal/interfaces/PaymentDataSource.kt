package company.tap.google.pay.internal.interfaces

import androidx.annotation.RestrictTo
import company.tap.google.pay.open.enums.AllowedMethods
import company.tap.google.pay.open.enums.SDKMode
import java.math.BigDecimal
@RestrictTo(RestrictTo.Scope.LIBRARY)
interface PaymentDataSource {
    /**
     * Transaction currency. @return the currency
     */
    fun getCurrency(): String?

    fun getAmount(): BigDecimal?

    fun getEnvironment(): SDKMode?

    fun getAllowedCardMethod(): AllowedMethods

    fun getAllowedNetworks(): MutableList<String>?

    fun getGatewayId(): String

    fun getGatewayMerchantId(): String

    fun getCountryCode(): String

}