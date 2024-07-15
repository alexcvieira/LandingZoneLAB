# Configure the Microsoft Azure Provider
provider "azurerm" {
  features {}
}

# Create a Resource Group Identity Subscription
resource "azurerm_resource_group" "RG-PublicDNS" {
  name     = "RG-PublicDNS"
  location = "brazilsouth"
}

# Create DNS Public Zone CONSORCIOSDACAIXA.NET.BR
resource "azurerm_dns_zone" "zone_CONSORCIOSDACAIXANETBR" {
  name                = "CONSORCIOSDACAIXA.NET.BR"
  resource_group_name = azurerm_resource_group.RG-PublicDNS.name
}

# Create Records TXT CONSORCIOSDACAIXA.NET.BR
resource "azurerm_dns_txt_record" "CONSORCIOSDACAIXANETBR" {
  zone_name           = azurerm_dns_zone.zone_CONSORCIOSDACAIXANETBR.name
  ttl                 = 900
  resource_group_name = azurerm_resource_group.RG-PublicDNS.name
  name                = "@"

  record {
    value = "v=spf1 -all"
  }
}

# Create DNS Public Zone CONSORCIOSDACAIXA.COM.BR
resource "azurerm_dns_zone" "zone_CONSORCIOSDACAIXACOMBR" {
  name                = "CONSORCIOSDACAIXA.COM.BR"
  resource_group_name = azurerm_resource_group.RG-PublicDNS.name
}

# Create Records TXT CONSORCIOSDACAIXA.COM.BR
resource "azurerm_dns_txt_record" "CONSORCIOSDACAIXACOMBR" {
  zone_name           = azurerm_dns_zone.zone_CONSORCIOSDACAIXACOMBR.name
  ttl                 = 900
  resource_group_name = azurerm_resource_group.RG-PublicDNS.name
  name                = "@"

  record {
    value = "v=spf1 -all"
  }
}

# Create DNS Public Zone CONSORCIOCAIXA.NET.BR
resource "azurerm_dns_zone" "zone_CONSORCIOCAIXANETBR" {
  name                = "CONSORCIOCAIXA.NET.BR"
  resource_group_name = azurerm_resource_group.RG-PublicDNS.name
}

# Create DNS Public Zone CONSORCIOCAIXA.COM.BR
resource "azurerm_dns_zone" "zone_CONSORCIOCAIXACOMBR" {
  name                = "CONSORCIOCAIXA.COM.BR"
  resource_group_name = azurerm_resource_group.RG-PublicDNS.name
}

# Create DNS Public Zone caixaconsorcio.com.br
resource "azurerm_dns_zone" "zone_caixaconsorciocombr" {
  name                = "caixaconsorcio.com.br"
  resource_group_name = azurerm_resource_group.RG-PublicDNS.name
}

# Create Records A caixaconsorcio.com.br
resource "azurerm_dns_a_record" "record_a_caixaconsorciocombr" {
  name                = "@"
  zone_name           = azurerm_dns_zone.zone_caixaconsorciocombr.name
  resource_group_name = azurerm_resource_group.RG-PublicDNS.name
  ttl                 = 300
  records             = ["200.10.245.57"]
}

# Create Records MX caixaconsorcio.com.br
resource "azurerm_dns_mx_record" "record_mx_caixaconsorciocombr" {
  zone_name           = azurerm_dns_zone.zone_caixaconsorciocombr.name
  ttl                 = 3600
  resource_group_name = azurerm_resource_group.RG-PublicDNS.name

  record {
    preference = "10"
    exchange   = "caixaconsorcio-com-br.mail.protection.outlook.com."
  }
}

# Create Records TXT caixaconsorcio.com.br
resource "azurerm_dns_txt_record" "caixaconsorciocombr" {
  zone_name           = azurerm_dns_zone.zone_caixaconsorciocombr.name
  ttl                 = 300
  resource_group_name = azurerm_resource_group.RG-PublicDNS.name
  name                = "@"

  record {
    value = "v=spf3 include:_u.caixaconsorcio.com.br._spf.smart.ondmarc.com -all"
  }
  record {
    value = "spf2.0/pra include: senderid.virtualtarget.com.br -all"
  }
    record {
    value = "v=spf1 mx ip4:201.48.252.130 ip4:189.8.1.186 ip4:45.175.107.26 ip4:200.10.245.61 ip4:200.10.245.69 ip4:200.10.245.64/29 include:sparkpostmail.com include:_spf.salesforce.com include:spf.protection.outlook.com -all"
  }
      record {
    value = "_globalsign-domain-verification=U_PnrZc4d0AW1G5aaiFmrbYW_2q6DekV0w3qXQv6_M"
  }
    record {
    value = "facebook-domain-verification=vjesnxdxj4qnhbi3n6vm4jl1wbm1ho"
  }
      record {
    value = "MS=ms24948959"
  }   
}

# Create DNS Public Zone caixaconsorcios.com.br
resource "azurerm_dns_zone" "zone_caixaconsorcios" {
  name                = "caixaconsorcios.com.br"
  resource_group_name = azurerm_resource_group.RG-PublicDNS.name
}

# Create Records A caixaconsorcios.com.br
resource "azurerm_dns_a_record" "record_a_caixaconsorcioscombr" {
  name                = "@"
  zone_name           = azurerm_dns_zone.zone_caixaconsorcios.name
  resource_group_name = azurerm_resource_group.RG-PublicDNS.name
  ttl                 = 300
  records             = ["200.10.245.57"]
}

# Create Records MX caixaconsorcios.com.br
resource "azurerm_dns_mx_record" "record_mx_caixaconsorcioscombr" {
  zone_name           = azurerm_dns_zone.zone_caixaconsorcios.name
  ttl                 = 3600
  resource_group_name = azurerm_resource_group.RG-PublicDNS.name

  record {
    preference = "10"
    exchange   = "caixaconsorcio-com-br.mail.protection.outlook.com."
  }
}

# Create Records TXT caixaconsorcios.com.br
resource "azurerm_dns_txt_record" "caixaconsorcioscombr" {
  zone_name           = azurerm_dns_zone.zone_caixaconsorcios.name
  ttl                 = 3600
  resource_group_name = azurerm_resource_group.RG-PublicDNS.name
  name                = "@"

    record {
    value = "v=spf1 mx ip4:200.10.245.61 ip4:200.10.245.69 ip4:200.10.245.64/29 include:spf.protection.outlook.com -all"
  }
    record {
    value = "_globalsign-domain-verification=5Cbc6ayGFpTLixf9yKbypCyhJLMqWx9cvLQiRaOvJT"
  }
    record {
    value = "_globalsign-domain-verification=iQb1AnkNiCWBtdlS-xIQ8MHnLqZdTnJi0WicjfAXN5"
  }
    record {
    value = "MS=ms85792227"
  }   
}

# Create DNS Public Zone caixaconsorcio.net.br
resource "azurerm_dns_zone" "zone_caixaconsorcionetbr" {
  name                = "caixaconsorcio.net.br"
  resource_group_name = azurerm_resource_group.RG-PublicDNS.name
}

# Create DNS Public Zone caixaconsorcios.net.br
resource "azurerm_dns_zone" "zone_caixaconsorciosnetbr" {
  name                = "caixaconsorcios.net.br"
  resource_group_name = azurerm_resource_group.RG-PublicDNS.name
}

# Create Records A caixaconsorcios.net.br
resource "azurerm_dns_a_record" "record_a_caixaconsorciosnetbr" {
  name                = "@"
  zone_name           = azurerm_dns_zone.zone_caixaconsorcionetbr.name
  resource_group_name = azurerm_resource_group.RG-PublicDNS.name
  ttl                 = 300
  records             = ["200.10.245.57"]
}

# Create DNS Public Zone caixaconsorciosadm.com.br
resource "azurerm_dns_zone" "zone_caixaconsorciosadmcombr" {
  name                = "caixaconsorciosadm.com.br"
  resource_group_name = azurerm_resource_group.RG-PublicDNS.name
}