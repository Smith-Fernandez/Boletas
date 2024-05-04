<?xml version="1.0" encoding="ISO-8859-1"?>
	<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:tmp="urn:oasis:names:specification:ubl:schema:xsd:Invoice-2" xmlns:cac="urn:oasis:names:specification:ubl:schema:xsd:CommonAggregateComponents-2" xmlns:cbc="urn:oasis:names:specification:ubl:schema:xsd:CommonBasicComponents-2" xmlns:ds="http://www.w3.org/2000/09/xmldsig#" xmlns:ext="urn:oasis:names:specification:ubl:schema:xsd:CommonExtensionComponents-2" xmlns:sac="urn:sunat:names:specification:ubl:peru:schema:xsd:SunatAggregateComponents-1" version="1.0">
    <xsl:output method="html" doctype-system="http://www.w3.org/TR/html4/strict.dtd" doctype-public="-//W3C//DTD HTML 4.01//EN" indent="yes"/>
    <xsl:decimal-format name="money" decimal-separator="." grouping-separator=","/>
    <xsl:template match="/tmp:Invoice">
		<html>
			<head>
				<title>Boleta de Venta Electrónica</title>
				<link rel="stylesheet" type="text/css" href="ebxml.css" />
			</head>
			<script language="JavaScript">
			    function multiplicar(valor1, valor2, valor3) {
					var des = valor1 * valor2;
					if (valor3 == "true"){
						des = 0;
					}
					des = des.toFixed(2);					
					document.write(des);
				}
				function sumar(valor1, valor2, valor3, valor4, valor5, valor6 ,valor7){
					var des = 0;
					if (valor6 != "true"){
						if (valor2==''){
							valor2 = '0.00';
						}
						if (valor3==''){
							valor3 = '0.00';
						}
						if (valor4==''){
							valor4 = '0.00';
						}
						if (valor5.indexOf("-") == 0){
							valor1 = valor1 * -1;
						}
						if (valor7==''){
							valor7 = '0.00';
						}
						des = parseFloat(valor1) + parseFloat(valor2) + parseFloat(valor3) + parseFloat(valor4)+ parseFloat(valor7);
					}
					des = des.toFixed(2);
					document.write(des);
				}
				function typeMoney(moneda) {
					var des = " - ";
					if(moneda == "PEN") {des = "SOLES";}
					if(moneda == "USD") {des = "DOLARES";}
					if(moneda == "XEU") {des = "EUROS";} 
					if(moneda == "EUR") {des = "EUROS";}
					if(moneda == "CAD") {des = "DOLAR CANADIENSE";}
					if(moneda == "GBP") {des = "LIBRA ESTERLINA";}
					if(moneda == "JPY") {des = "YEN";}
					if(moneda == "SEK") {des = "CORONA SUECA";}
					if(moneda == "CHF") {des = "FRANCO SUIZO";}
					document.write(des);
				}
				function simbolMoney(moneda) {
					var des = "";
					if(moneda == "PEN") {des = "S/";}
					if(moneda == "USD") {des = "&#36;";}
					if(moneda == "XEU") {des = "&#8364;";}
					if(moneda == "EUR") {des = "&#8364;";}
					if(moneda == "CAD") {des = "C&#36;";}
					if(moneda == "GBP") {des = "&#163;";}
					if(moneda == "JPY") {des = "&#165;";}
					if(moneda == "SEK") {des = "&#83;&#69;&#75;";}
					if(moneda == "CHF") {des = "&#83;&#119;&#70;";}
					document.write(des);
				}
				function descripTipoDoc(tipoDoc){					 
					var des = "";
					if(tipoDoc == "06" || tipoDoc == "6") {	des = "R.U.C.";	}
					if(tipoDoc == "04" || tipoDoc == "4") {	des = "C. EXT.";}
					if(tipoDoc == "07" || tipoDoc == "7") { des = "PASAPORTE";}
					if(tipoDoc == "01" || tipoDoc == "1") {	des = "D.N.I";}
					if(tipoDoc == "00" || tipoDoc == "0") { des = "DT.S/RUC";} <!-- DOC.TRIB.NO.DOM.SIN.RUC -->
					if(tipoDoc == "101" || tipoDoc == "91" || tipoDoc == "A") { des = "C.IDENT";} <!-- CARNET DE IDENTIDAD -->
					if(tipoDoc == "102" || tipoDoc == "92" || tipoDoc == "F") {	des = "C.PTP";} <!-- CARNET PERMISO TEMP.PERMANENCIA -->
					if(tipoDoc == "B") { des = "DI-PN NO D";} <!-- DOC.IDENTIF.PERS.NAT.NO DOM. -->
					document.write(des);
				}
			</script>
			
			<body>
				<TABLE ALIGN="center" class="form-table" width="700px">
					<tbody>
						<tr>
							<td width="30%">
								<TABLE>
									<TBODY>
										<tr class="bgn">
											<td>
												<xsl:value-of select="cac:AccountingSupplierParty/cac:Party/cac:PartyName/cbc:Name" />
											</td>
										</tr>
										<tr class="bgn">
											<td>
												<xsl:value-of select="cac:AccountingSupplierParty/cac:Party/cac:PartyLegalEntity/cbc:RegistrationName" />
											</td>
										</tr>
										<tr>
											<td>
												<xsl:value-of select="cac:AccountingSupplierParty/cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cac:AddressLine/cbc:Line" />
												<xsl:value-of select="cac:AccountingSupplierParty/cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cbc:BuildingNumber" />
											</td>
										</tr>
										<tr>
											<td>
												<xsl:value-of select="cac:AccountingSupplierParty/cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cbc:CityName" />
												-
												<xsl:value-of select="cac:AccountingSupplierParty/cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cbc:CountrySubentity" />
												-
												<xsl:value-of select="cac:AccountingSupplierParty/cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cbc:District" />
											</td>
										</tr>
									</TBODY>
								</TABLE>
							</td>
							
							<td width="30%">
								<TABLE align="right" class="form-table">
									<TBODY>
										<tr>
											<td class="T3">BOLETA DE VENTA ELECTRÓNICA</td>
										</tr>
										<tr>
											<td class="T2">
												R.U.C.
												<xsl:value-of select="cac:AccountingSupplierParty/cac:Party/cac:PartyIdentification/cbc:ID" />
											</td>
										</tr>
										<tr>
											<td class="T2">
												<xsl:value-of select="cbc:ID" />
											</td>
										</tr>
									</TBODY>
								</TABLE>
							</td>
						</tr>

						<tr>
							<td colspan="2">
								<table width="100%" class="form-table-2">
									<tbody>
										<tr>
											<td width="48%">
												<TABLE>
													<TBODY>
														<TR class="bgn">
															<TD width="90">Fecha de Vencimiento:</TD>
															<TD>
																<xsl:value-of select="cbc:DueDate" />
															</TD>
														</TR>													
														<TR class="bgn">
															<TD width="90">Fecha de Emisión:</TD>
															<TD>
																<xsl:value-of select="cbc:IssueDate" />
															</TD>
														</TR>
														<TR class="bgn">
															<TD>Señor(es):</TD>
															<TD>				
																<xsl:value-of select="cac:AccountingCustomerParty/cac:Party/cac:PartyLegalEntity/cbc:RegistrationName" />
															</TD>
														</TR>
														<xsl:if test="cac:AccountingCustomerParty/cac:Party/cac:PartyIdentification/cbc:ID/@schemeID != '-'">
															<TR class="bgn">
																<TD>
																	<script>
																		descripTipoDoc("<xsl:value-of select='cac:AccountingCustomerParty/cac:Party/cac:PartyIdentification/cbc:ID/@schemeID' />");
																	</script>
																	:
																</TD>
																<TD>
																	<xsl:value-of select="cac:AccountingCustomerParty/cac:Party/cac:PartyIdentification/cbc:ID" />
																</TD>
															</TR>
														</xsl:if>
														<xsl:if test="cac:SellerSupplierParty/cac:Party/cac:PostalAddress/cac:AddressLine/cbc:Line != ''">
															<tr class="bgn">
																<td>
																	Establecimiento del Emisor:
																</td>
																<td>
																	<xsl:value-of select="cac:SellerSupplierParty/cac:Party/cac:PostalAddress/cac:AddressLine/cbc:Line" />
																</td>
															</tr>
														</xsl:if>
														<xsl:if test="cac:SellerSupplierParty/cac:Party/cac:PostalAddress/cbc:StreetName != ''">
															<tr class="bgn">
																<td>
																	Establecimiento del Emisor:
																</td>
																<td>
																	<xsl:value-of select="cac:SellerSupplierParty/cac:Party/cac:PostalAddress/cbc:StreetName" />
																</td>
															</tr>
														</xsl:if>
														<xsl:if test="cac:AccountingCustomerParty/cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cac:AddressLine/cbc:Line != ''">
															<TR class="bgn">
																<td>
																	Dirección del cliente:																	
																</td>
																<td>
																	<xsl:value-of select="cac:AccountingCustomerParty/cac:Party/cac:PartyLegalEntity/cac:RegistrationAddress/cac:AddressLine/cbc:Line" />
																</td>
															</TR>
														</xsl:if>
														<TR class="bgn">
															<td width="100">Tipo de Moneda:</td>
															<td>
																<script>
																	typeMoney("<xsl:value-of select='cbc:DocumentCurrencyCode' />");
																</script>
															</td>
														</TR>
														<TR class="bgn">
															<td width="100">Observación:</td>
															<td>
																<xsl:value-of select="cbc:Note[not(@*)]"/>
															</td>
														</TR>
													</TBODY>
												</TABLE>
											</td>
											<td width="52%" valign="top" align="right">												
												<table width="100%">
													<xsl:for-each select="cac:DespatchDocumentReference">
														<tr>
															<td width="70%">
																<xsl:value-of select="cbc:DocumentType" />
															</td>
															<td width="30%" align="right">
																<xsl:value-of select="cbc:ID" />
															</td>
														</tr>
													</xsl:for-each>														
													<xsl:for-each select="cac:AdditionalDocumentReference">
														<tr>
															<td width="70%">
																<xsl:value-of select="cbc:DocumentType" />
															</td>
															<td width="30%" align="right">
																<xsl:value-of select="cbc:ID" />
															</td>
														</tr>
													</xsl:for-each>														
												</table>											
											</td>
										</tr>
									</tbody>
								</table>
							</td>
						</tr>
						
						<tr>
							<td colspan="2">
								<TABLE width="100%" class="form-table-2">
									<TBODY>
										<tr class="beta" align="center">
											<td width="10"></td>
											<td width="10%">CANTIDAD</td>
											<td width="14%">UNIDAD MEDIDA</td>
											<td width="10%">CODIGO</td>
											<td width="23%">DESCRIPCION</td>
											<xsl:choose>
												<xsl:when test="cac:TaxTotal/cac:TaxSubtotal[cac:TaxCategory/cac:TaxScheme/cbc:ID=7152]/cbc:TaxAmount != ''">
													<td width="10%">VALOR UNITARIO(*)</td>
													<td width="10%">DESCUENTO(*)</td>
													<td width="9%">ICBPER</td>
												</xsl:when>
												<xsl:otherwise>
													<td width="15%">VALOR UNITARIO(*)</td>
													<td width="14%">DESCUENTO(*)</td>
												</xsl:otherwise>
										</xsl:choose>										
											<td width="14%">IMPORTE DE VENTA(**)</td>
										</tr>
										<xsl:for-each select="cac:InvoiceLine">											
											<tr>												
												<td align="center">
													<!-- <xsl:value-of select="cac:OrderLineReference/cbc:LineID" /> -->
												</td>
												<td align="center">
													<xsl:value-of select="cbc:InvoicedQuantity" />
												</td>
												<td align="center">
													<xsl:value-of select="cbc:InvoicedQuantity/@unitCode" />
												</td>
												<td align="center">
													<xsl:value-of select="cac:Item/cac:SellersItemIdentification/cbc:ID" />
												</td>
												<td>
													<xsl:value-of select="cac:Item/cbc:Description" />
												</td>												
												<td align="right">
													 <xsl:value-of select="cac:Price/cbc:PriceAmount" />
												</td>
												<td align="right">
													<xsl:value-of select="cac:AllowanceCharge/cbc:Amount" />
												</td>
												<xsl:if test="cac:TaxTotal/cac:TaxSubtotal[cac:TaxCategory/cac:TaxScheme/cbc:ID=7152]/cbc:TaxAmount">
													<xsl:choose>
														<xsl:when test="cac:TaxTotal/cac:TaxSubtotal/cac:TaxCategory/cbc:PerUnitAmount">
															<td align="center">
																<xsl:value-of select="cac:TaxTotal/cac:TaxSubtotal/cac:TaxCategory/cbc:PerUnitAmount" />
															</td>
														</xsl:when>
														<xsl:otherwise>
															<td>
																<td align="center">0.00</td> 
															</td>
														</xsl:otherwise>
													</xsl:choose>
												</xsl:if>																 
												<td align="right">
													<!--<xsl:value-of select="cac:PricingReference/cac:AlternativeConditionPrice/cbc:PriceAmount" />-->
													<script>
														sumar("<xsl:value-of select="cbc:LineExtensionAmount" />",
														      "<xsl:value-of select="cac:TaxTotal/cac:TaxSubtotal[cac:TaxCategory/cac:TaxScheme/cbc:ID=1000]/cbc:TaxAmount" />",
															  "<xsl:value-of select="cac:TaxTotal/cac:TaxSubtotal[cac:TaxCategory/cac:TaxScheme/cbc:ID=2000]/cbc:TaxAmount" />",
															  "<xsl:value-of select="cac:TaxTotal/cac:TaxSubtotal[cac:TaxCategory/cac:TaxScheme/cbc:ID=9999]/cbc:TaxAmount" />",
															  "<xsl:value-of select="cac:PricingReference/cac:AlternativeConditionPrice/cbc:PriceAmount" />",
															  "<xsl:value-of select="cbc:FreeOfChargeIndicator"/>",
															  "<xsl:value-of select="cac:TaxTotal/cac:TaxSubtotal[cac:TaxCategory/cac:TaxScheme/cbc:ID=7152]/cac:TaxCategory/cbc:PerUnitAmount" />");
													</script>								
												</td>
											</tr>
										</xsl:for-each>
									</TBODY>
								</TABLE>
							</td>
						</tr>
						
						<tr>
							<td colspan="2">
								<TABLE width="100%" class="form-table-3">
									<TBODY>
										<tr>
											<td colspan="2">
												<TABLE width="100%" class="form-table-4">
													<TBODY>
														<tr>
															<td width="70%" valign="top"></td>
															<td valign="top">
																<TABLE align="right" >
																	<TBODY>
																		<tr align="right">
																			<td class="gamma">OTROS CARGOS</td>
																			<td align="right">
																				<script>
																					simbolMoney("<xsl:value-of select='cbc:DocumentCurrencyCode' />")
																				</script>	
																				<xsl:value-of select="cac:LegalMonetaryTotal/cbc:ChargeTotalAmount" />
																			</td>
																		</tr>
																		<tr align="right">
																			<td class="gamma">OTROS TRIBUTOS</td>
																			<td>
																				<script>
																					simbolMoney("<xsl:value-of select='cbc:DocumentCurrencyCode' />");
																				</script>	
																				<xsl:choose>
																					<xsl:when test="cac:TaxTotal[cac:TaxSubtotal/cac:TaxCategory/cac:TaxScheme/cbc:ID=9999]/cbc:TaxAmount">
																						<xsl:value-of select="cac:TaxTotal[cac:TaxSubtotal/cac:TaxCategory/cac:TaxScheme/cbc:ID=9999]/cbc:TaxAmount" />
																					</xsl:when>
																					<xsl:otherwise>0.00</xsl:otherwise>
																				</xsl:choose>
																				<!--<xsl:value-of select="cac:TaxTotal[cac:TaxSubtotal/cac:TaxCategory/cac:TaxScheme/cbc:ID=9999]/cbc:TaxAmount" /> -->	
																			</td>
																		</tr>
																			
																		<xsl:choose>
																			<xsl:when test="cac:TaxTotal[cac:TaxSubtotal/cac:TaxCategory/cac:TaxScheme/cbc:ID=7152]/cbc:TaxAmount">
																				<tr align="right">
																					<td class="gamma">IMPORTE ICBPER</td>
																					<td>
																						<script>
																							simbolMoney("<xsl:value-of select='cbc:DocumentCurrencyCode' />");
																						</script>
																						<xsl:value-of select="cac:TaxTotal[cac:TaxSubtotal/cac:TaxCategory/cac:TaxScheme/cbc:ID=7152]/cbc:TaxAmount" />
																					</td>
																				</tr>																		
																			</xsl:when>
																			<xsl:otherwise></xsl:otherwise>
																		</xsl:choose>
																			
																		<tr align="right">
																			<td width="20%" class="gamma-importeTotal">IMPORTE TOTAL</td>
																			<td width="16%" class="bgn">
																				<script>
																					simbolMoney("<xsl:value-of select='cbc:DocumentCurrencyCode' />");
																				</script>
																				<xsl:value-of select="cac:LegalMonetaryTotal/cbc:PayableAmount" />
																			</td>
																		</tr>
																	</TBODY>
																</TABLE>
															</td>
														</tr>														
													</TBODY>
												</TABLE>
											</td>
										</tr>
										
										<tr>
											<td width="65%">
												<TABLE width="100%">
													<TBODY>
														<tr>
															<td colspan="2">(*) Sin impuestos.</td>
														</tr>
														<tr>
															<td colspan="2">(**) Incluye impuestos, de ser Op. Gravada.</td>
														</tr>
														<tr></tr><tr></tr>
														<!-- <xsl:for-each select="ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/sac:AdditionalInformation/sac:AdditionalMonetaryTotal">
															<xsl:choose>
																<xsl:when match=".[cbc:ID = 1004]">
																	<tr>
																		<td>VALOR DE VENTA DE OPERACIONES GRATUITAS</td>
																		<td>
																			<script>	
																				simbolMoney("<xsl:value-of select='cbc:DocumentCurrencyCode' />");
																			</script>
																			<xsl:value-of select="cbc:PayableAmount" />
																		</td>
																	</tr>
																</xsl:when>
															</xsl:choose>
														</xsl:for-each>
										
														<xsl:for-each select="ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/sac:AdditionalInformation/sac:AdditionalProperty">
															<xsl:choose>
																<xsl:when match=".[cbc:ID = 1000]"></xsl:when>
																<xsl:when match=".[cbc:ID = 5000]">
																	<xsl:if test=".[cbc:Value != '  ' and cbc:Value != '']">
																		<tr>
																			<td width="50%"><xsl:value-of select="cbc:Name" /></td>
																			<td><xsl:value-of select="string(number(cbc:Value))" /></td>
																		</tr>
																	</xsl:if>
																</xsl:when>
																<xsl:when match=".[cbc:ID = 5001]">
																	<xsl:if test=".[cbc:Value != '  ' and cbc:Value != '']">
																		<tr>
																			<td><xsl:value-of select="cbc:Name" /></td>
																			<td><xsl:value-of select="cbc:Value" /></td>
																		</tr>
																	</xsl:if>
																</xsl:when>	
																<xsl:when match=".[cbc:ID = 5002]">
																	<xsl:if test=".[cbc:Value != '  ' and cbc:Value != '']">
																		<tr>
																			<td><xsl:value-of select="cbc:Name" /></td>
																			<td><xsl:value-of select="cbc:Value" /></td>
																		</tr>
																	</xsl:if>
																</xsl:when>  
																<xsl:when match=".[cbc:ID = 5003]">
																	<xsl:if test=".[cbc:Value != '  ' and cbc:Value != '']">
																		<tr>
																			<td><xsl:value-of select="cbc:Name" /></td>
																			<td><xsl:value-of select="cbc:Value" /></td>
																		</tr>
																	</xsl:if>
																</xsl:when>
																<xsl:otherwise>
																	<tr><td><xsl:value-of select="cbc:Value" /></td></tr>	
																</xsl:otherwise>
															</xsl:choose>
														</xsl:for-each>
														<xsl:if test="cac:OrderReference/cbc:ID">
															<xsl:if test=".[cac:OrderReference/cbc:ID != '']">
																<tr>
																	<td>Orden de Compra</td>
																	<td><xsl:value-of select="cac:OrderReference/cbc:ID" /></td>
																</tr>
															</xsl:if>
														</xsl:if> -->
														
														<xsl:choose>
															<xsl:when test="cbc:Note/@languageLocaleID = 1000">
																<tr>
																	<td>
																		<strong> <xsl:value-of select="cbc:Note[@languageLocaleID=1000]" /> </strong>
																	</td>
																</tr>
															</xsl:when>
														</xsl:choose>
														
														<xsl:choose>
															<xsl:when test="cac:TaxTotal/cac:TaxSubtotal/cac:TaxCategory/cac:TaxScheme/cbc:ID = 9996">
																<tr>
																	<td>Valor de Venta de Operaciones Gratuitas:</td>
																	<td>
																		<script>
																			simbolMoney("<xsl:value-of select='cbc:DocumentCurrencyCode' />");
																		</script>
																		<xsl:for-each select="cac:TaxTotal/cac:TaxSubtotal[cac:TaxCategory/cac:TaxScheme/cbc:ID=9996]">
																			<xsl:value-of select="cbc:TaxableAmount" />
																		</xsl:for-each>
																	</td>
																</tr>
															</xsl:when>
															<xsl:otherwise></xsl:otherwise>
														</xsl:choose>
															
														<xsl:choose>
															<xsl:when test="cbc:Note/@languageLocaleID = 5000">
																<tr>
																	<td>Nro. Expediente:</td>
																	<td>
																		<xsl:value-of select="cbc:Note[@languageLocaleID=5000]" />
																	</td>
																</tr>
															</xsl:when>
															<xsl:otherwise></xsl:otherwise>
														</xsl:choose>
														
														<xsl:choose>
															<xsl:when test="cbc:Note/@languageLocaleID = 5001">
																<tr>
																	<td>Código unidad ejecutora:</td>
																	<td>
																		<xsl:value-of select="cbc:Note[@languageLocaleID=5001]" />
																	</td>
																</tr>
															</xsl:when>
															<xsl:otherwise></xsl:otherwise>
														</xsl:choose>
														
														<xsl:choose>
															<xsl:when test="cbc:Note/@languageLocaleID = 5002">
																<tr>
																	<td>Nro. Proceso Selección</td>
																	<td>
																		<xsl:value-of select="cbc:Note[@languageLocaleID=5002]" />
																	</td>
																</tr>
															</xsl:when>
															<xsl:otherwise></xsl:otherwise>
														</xsl:choose>
														
														<xsl:choose>
															<xsl:when test="cbc:Note/@languageLocaleID = 5003">
																<tr>
																	<td>Nro. de Contrato</td>
																	<td>
																		<xsl:value-of select="cbc:Note[@languageLocaleID=5003]" />
																	</td>
																</tr>
															</xsl:when>
															<xsl:otherwise></xsl:otherwise>
														</xsl:choose>														
															
														<xsl:choose>
															<xsl:when test="cac:OrderReference/cbc:ID">
																<tr>
																	<td>Orden de Compra</td>
																	<td>
																		<xsl:value-of select="cac:OrderReference/cbc:ID" />
																	</td>
																</tr>																		
															</xsl:when>
															<xsl:otherwise></xsl:otherwise>
														</xsl:choose>
														<tr>
															<td></td>
															<td><xsl:value-of select="cbc:UBLExtensions/cbc:Description" /></td>
														</tr>
													</TBODY>
												</TABLE>
											</td>
											
											<td width="35%" valign="top">
												<TABLE width="100%" align="right">
													<TBODY>
														<tr>
															<td>
																<TABLE class="form-table">
																	<TBODY>
																		<!-- <tr align="right">
																			<td class="gamma">OP.GRAVADA</td>
																			<td align="right">
																				<script>
																					simbolMoney("<xsl:value-of select='cbc:DocumentCurrencyCode' />");
																				</script>
																				<xsl:value-of select="ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/sac:AdditionalInformation/sac:AdditionalMonetaryTotal[cbc:ID=1001]/cbc:PayableAmount" />																												
																			</td>
																		</tr> -->
																		<tr align="right">
																			<td class="gamma">OP.GRAVADA</td>
																			<td align="right">
																				<script>
																					simbolMoney("<xsl:value-of select='cbc:DocumentCurrencyCode' />");
																				</script>
																				<xsl:choose>
																					<xsl:when test="cac:TaxTotal/cac:TaxSubtotal/cac:TaxCategory/cac:TaxScheme/cbc:ID = 1000">
																						<xsl:for-each select="cac:TaxTotal/cac:TaxSubtotal[cac:TaxCategory/cac:TaxScheme/cbc:ID=1000]">
																							<xsl:value-of select="cbc:TaxableAmount" />
																						</xsl:for-each>
																					</xsl:when>
																					<xsl:otherwise>0.00</xsl:otherwise>
																				</xsl:choose>
																			</td>
																		</tr>
																		
																		<tr align="right">
																			<td class="gamma">OP.EXONERADA</td>
																			<td align="right">
																				<script>
																					simbolMoney("<xsl:value-of select='cbc:DocumentCurrencyCode' />");
																				</script>
																				<!-- <xsl:choose>
																					<xsl:when test="ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/sac:AdditionalInformation/sac:AdditionalMonetaryTotal[cbc:ID=1003]/cbc:PayableAmount">
																						<xsl:value-of select="ext:UBLExtensions/ext:UBLExtension/ext:ExtensionContent/sac:AdditionalInformation/sac:AdditionalMonetaryTotal[cbc:ID=1003]/cbc:PayableAmount" />
																					</xsl:when>
																					<xsl:otherwise>0.00</xsl:otherwise>
																				</xsl:choose> -->	
																				<xsl:choose>
																					<xsl:when test="cac:TaxTotal/cac:TaxSubtotal/cac:TaxCategory/cac:TaxScheme/cbc:ID = 9997">
																						<xsl:for-each select="cac:TaxTotal/cac:TaxSubtotal[cac:TaxCategory/cac:TaxScheme/cbc:ID=9997]">
																							<xsl:value-of select="cbc:TaxableAmount" />
																						</xsl:for-each>
																					</xsl:when>
																					<xsl:otherwise>0.00</xsl:otherwise>
																				</xsl:choose>
																			</td>
																		</tr>
														
																		<tr align="right">
																			<td class="gamma">OP.INAFECTA</td>
																			<td align="right">
																				<script>
																					simbolMoney("<xsl:value-of select='cbc:DocumentCurrencyCode' />");
																				</script>
																				<xsl:choose>
																					<xsl:when test="cac:TaxTotal/cac:TaxSubtotal/cac:TaxCategory/cac:TaxScheme/cbc:ID = 9998">
																						<xsl:for-each select="cac:TaxTotal/cac:TaxSubtotal[cac:TaxCategory/cac:TaxScheme/cbc:ID=9998]">
																							<xsl:value-of select="cbc:TaxableAmount" />
																						</xsl:for-each>
																					</xsl:when>
																					<xsl:otherwise>0.00</xsl:otherwise>
																				</xsl:choose>
																			</td>
																		</tr>														
															
																		<tr align="right">
																			<td class="gamma">ISC</td>
																			<td align="right">
																				<script>
																					simbolMoney("<xsl:value-of select='cbc:DocumentCurrencyCode' />");
																				</script>
																				<!-- <xsl:choose>
																					<xsl:when test="cac:TaxTotal[cac:TaxSubtotal/cac:TaxCategory/cac:TaxScheme/cbc:ID=2000]/cbc:TaxAmount">
																						<xsl:value-of select="cac:TaxTotal[cac:TaxSubtotal/cac:TaxCategory/cac:TaxScheme/cbc:ID=2000]/cbc:TaxAmount" />
																					</xsl:when>
																					<xsl:otherwise>0.00</xsl:otherwise>
																				</xsl:choose> -->
																				<xsl:choose>
																					<xsl:when test="cac:TaxTotal/cac:TaxSubtotal/cac:TaxCategory/cac:TaxScheme/cbc:ID = 2000">
																						<xsl:for-each select="cac:TaxTotal/cac:TaxSubtotal[cac:TaxCategory/cac:TaxScheme/cbc:ID=2000]">
																							<xsl:value-of select="cbc:TaxableAmount" />
																						</xsl:for-each>
																					</xsl:when>
																					<xsl:otherwise>0.00</xsl:otherwise>
																				</xsl:choose>
																			</td>
																		</tr>
															
																		<tr align="right">
																			<td class="gamma">IGV</td>
																			<td align="right">
																				<script>
																					simbolMoney("<xsl:value-of select='cbc:DocumentCurrencyCode' />");
																				</script>
																				<xsl:choose>
																					<xsl:when test="cac:TaxTotal/cac:TaxSubtotal/cac:TaxCategory/cac:TaxScheme/cbc:ID = 1000">
																						<xsl:value-of select="cac:TaxTotal[cac:TaxSubtotal/cac:TaxCategory/cac:TaxScheme/cbc:ID=1000]/cbc:TaxAmount" /> 
																					</xsl:when>
																					<xsl:otherwise>0.00</xsl:otherwise>
																				</xsl:choose>
																			</td>
																		</tr>
															
																		<xsl:choose>
																			<xsl:when test="cac:TaxTotal[cac:TaxSubtotal/cac:TaxCategory/cac:TaxScheme/cbc:ID=7152]/cbc:TaxAmount">
																				<tr align="right">
																					<td class="gamma">IMPORTE ICBPER</td>
																					<td>
																						<script>
																							simbolMoney("<xsl:value-of select='cbc:DocumentCurrencyCode' />");
																						</script>
																						<!-- <xsl:value-of select="cac:TaxTotal[cac:TaxSubtotal/cac:TaxCategory/cac:TaxScheme/cbc:ID=7152]/cbc:TaxAmount" /> -->
																						<xsl:choose>
																							<xsl:when test="cac:TaxTotal/cac:TaxSubtotal/cac:TaxCategory/cac:TaxScheme/cbc:ID = 7152">
																								<xsl:for-each select="cac:TaxTotal/cac:TaxSubtotal[cac:TaxCategory/cac:TaxScheme/cbc:ID=7152]">
																									<xsl:value-of select="cbc:TaxableAmount" />
																								</xsl:for-each>
																							</xsl:when>
																							<xsl:otherwise>0.00</xsl:otherwise>
																						</xsl:choose>
																					</td>
																				</tr>																		
																			</xsl:when>
																			<xsl:otherwise></xsl:otherwise>
																		</xsl:choose>
															
																		<tr align="right">
																			<td class="gamma">OTROS CARGOS</td>
																			<td align="right">
																				<script>
																					simbolMoney("<xsl:value-of select='cbc:DocumentCurrencyCode' />");
																				</script>
																				<xsl:value-of select="cac:LegalMonetaryTotal/cbc:ChargeTotalAmount" />
																			</td>
																		</tr>
															
																		<tr align="right">
																			<td class="gamma">OTROS TRIBUTOS</td>
																			<td>
																				<script>
																					simbolMoney("<xsl:value-of select='cbc:DocumentCurrencyCode' />");
																				</script>
																				<!-- <xsl:choose>
																					<xsl:when test="cac:TaxTotal[cac:TaxSubtotal/cac:TaxCategory/cac:TaxScheme/cbc:ID=9999]/cbc:TaxAmount">
																						<xsl:value-of select="cac:TaxTotal[cac:TaxSubtotal/cac:TaxCategory/cac:TaxScheme/cbc:ID=9999]/cbc:TaxAmount" />
																					</xsl:when>
																					<xsl:otherwise>0.00</xsl:otherwise>
																				</xsl:choose> -->
																				<xsl:choose>
																					<xsl:when test="cac:TaxTotal/cac:TaxSubtotal/cac:TaxCategory/cac:TaxScheme/cbc:ID = 9999">
																						<xsl:for-each select="cac:TaxTotal/cac:TaxSubtotal[cac:TaxCategory/cac:TaxScheme/cbc:ID=9999]">
																							<xsl:value-of select="cbc:TaxableAmount" />
																						</xsl:for-each>
																					</xsl:when>
																					<xsl:otherwise>0.00</xsl:otherwise>
																				</xsl:choose>
																			</td>
																		</tr>
																		
																		<!-- Inicio PAS20201U210100285 - Giancarlo Nepo López -->
																		<tr align="right">
																			<td class="gamma">MONTO DE REDONDEO</td>
																			<td>
																				<script>
																					simbolMoney("<xsl:value-of select='cbc:DocumentCurrencyCode' />");
																				</script>
																				<xsl:choose>
																					<xsl:when test="cac:LegalMonetaryTotal/cbc:PayableRoundingAmount">
																						<xsl:value-of select="cac:LegalMonetaryTotal/cbc:PayableRoundingAmount" />
																					</xsl:when>
																					<xsl:otherwise>0.00</xsl:otherwise>
																				</xsl:choose>
																			</td>
																		</tr>
																		<!-- Fin PAS20201U210100285 - Giancarlo Nepo López -->
															
																		<tr align="right">
																			<td width="20%" class="gamma-importeTotal">IMPORTE TOTAL</td>
																			<td width="16%" class="bgn">
																				<script>
																					simbolMoney("<xsl:value-of select='cbc:DocumentCurrencyCode' />");
																				</script>
																				<xsl:value-of select="cac:LegalMonetaryTotal/cbc:PayableAmount" />
																			</td>
																		</tr>
																	</TBODY>
																</TABLE>
															</td>
														</tr>
													</TBODY>
												</TABLE>
											</td>
										</tr>
									</TBODY>
								</TABLE>
							</td>
						</tr>
						<tr><td colspan="2" align="center" ></td></tr>
						<tr><td colspan="2" align="center" class="form-table" >Esta es una representación impresa de la Boleta de Venta Electrónica, generada en el Sistema de la SUNAT. El Emisor Electrónico puede verificarla utilizando su clave SOL, el Adquirente o Usuario puede consultar su validez en SUNAT Virtual: <a href="http://www.sunat.gob.pe/">www.sunat.gob.pe</a>, en Opciones sin Clave SOL/ Consulta de Validez del CPE.</td></tr>
						<tr><td colspan="2" align="center" ></td></tr>
					</tbody>
				</TABLE>
			</body>
		</html>
	</xsl:template>
</xsl:stylesheet> 
 