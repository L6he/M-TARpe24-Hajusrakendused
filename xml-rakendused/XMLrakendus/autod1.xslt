<?xml version="1.0"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
	<xsl:output encoding="UTF-8" method="html" />
	<xsl:template match="/">
		Registrinumbrid:<br/>
		<xsl:for-each select="autod/auto">
			<xsl:value-of select="registrinumber" />;
			<br/>
		</xsl:for-each><br/>


		Registrinumbri numbrite osa:<br/>
		<xsl:for-each select="autod/auto">
			<xsl:value-of select="substring(registrinumber, 1, 3)" />;
			<br/>
		</xsl:for-each><br/>

		Registrinumbri tähtede osa:<br/>
		<xsl:for-each select="autod/auto">
			<xsl:value-of select="substring(registrinumber, 5, 8)" />;
			<br/>
		</xsl:for-each><br/>

		Perekonnanime esimene täht:<br/>
		<xsl:for-each select="autod/auto">
			<xsl:value-of select="substring(perenimi, 1, 1)" />;
			<br/>
		</xsl:for-each><br/>

		Perekonnanime viimane täht:<br/>
		<xsl:for-each select="autod/auto">
			<xsl:value-of select="substring(perenimi, string-length(perenimi))" />;
			<br/>
		</xsl:for-each><br/>
		
		Kaalikate arv:<br/>
		<xsl:value-of select="count(/autod/auto[perenimi='Kaalikas'])" />.
		<br/>
		<br/>

		M algtähtede arv:<br/>
		<xsl:value-of select="count(/autod/auto[substring(perenimi, 1, 1)='M'])" />.
		<br/>
		<br/>

		2 lõppevate numbrite arv:<br/>
		<xsl:value-of select="count(/autod/auto[substring(registrinumber, 3, 1)=2])" />.
		<br/>
		<br/>

		1 või 2 lõppevate numbrite arv:<br/>
		<xsl:value-of select="count(/autod/auto[substring(registrinumber, 3, 1) &lt; 3])" />.<br/><br/>

		<xsl:for-each select="autod/auto">
			<xsl:if test="substring(registrinumber, 3, 1)=5">
				Auto: <xsl:value-of select="registrinumber" />;<br/>
				Ülevaatuse kuu on juuli.
			</xsl:if>
		</xsl:for-each><br/><br/>

		<xsl:for-each select="autod/auto">
			<xsl:if test="contains(perenimi, 'x')">
				Auto: <xsl:value-of select="registrinumber" />;<br/>
				Perenimi: <xsl:value-of select="perenimi" />;<br/>
				Tegemist on võõrnimega. Rassism.<br/><br/>
			</xsl:if>
			<xsl:if test="not(contains(perenimi, 'x'))">
				Auto: <xsl:value-of select="registrinumber" />;<br/>
				Perenimi: <xsl:value-of select="perenimi" />;<br/>
				Tegemist ei ole võõrnimega.<br/><br/>
			</xsl:if>
		</xsl:for-each>
		
		Kõik perekonnanimed:<br/>
		<xsl:for-each select="autod/auto">
			<xsl:value-of select="concat(position(),' - ',perenimi)" />;
			<br/>
		</xsl:for-each><br/>
		
		Spicy registrinumbrid:<br/>
		<xsl:for-each select="autod/auto">
			<xsl:if test="contains(substring(registrinumber, 3, 1), 2) or contains(substring(registrinumber, 3, 1), 1)">
				<b><xsl:value-of select="registrinumber" /></b>;
				<br/>
			</xsl:if>
			<xsl:if test="not(contains(substring(registrinumber, 3, 1), 1)) and not(contains(substring(registrinumber, 3, 1), 2))">
				<xsl:value-of select="registrinumber" />;
				<br/>
			</xsl:if>
		</xsl:for-each><br/>

		<table>
			<tr>
				<th>Perenimi</th>
				<th>Registrinumber</th>
			</tr>
			<xsl:for-each select="/autod/auto">
				<tr>
					<td>
						<xsl:if test="position() mod 2 !=0">
							<xsl:attribute name="style">
								background-color:white
							</xsl:attribute>
						</xsl:if>
						<xsl:if test="position() mod 2 =0">
							<xsl:attribute name="style">
								background-color:lightgray
							</xsl:attribute>
						</xsl:if>
						<xsl:if test="position() mod 3 =0">
							<xsl:attribute name="style">
								background-color:yellow
							</xsl:attribute>
						</xsl:if>
						<xsl:value-of select="perenimi" />
					</td>
					
					<td>
						<xsl:if test="position() mod 2 !=0">
							<xsl:attribute name="style">
								background-color:lightgray
							</xsl:attribute>
						</xsl:if>
						<xsl:if test="position() mod 2 =0">
							<xsl:attribute name="style">
								background-color:yellow
							</xsl:attribute>
						</xsl:if>
						<xsl:if test="position() mod 3 =0">
							<xsl:attribute name="style">
								background-color:white
							</xsl:attribute>
						</xsl:if>
						<xsl:value-of select="registrinumber" />
					</td>
				</tr>
			</xsl:for-each>
		</table>
	</xsl:template>
</xsl:stylesheet>