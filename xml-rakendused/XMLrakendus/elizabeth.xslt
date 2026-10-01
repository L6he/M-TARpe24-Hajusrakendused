<?xml version="1.0"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
	<xsl:output encoding="UTF-8" method="html" />
	<xsl:param name="otsing"></xsl:param>
	<xsl:param name="pikkus">0</xsl:param>
	<xsl:template match="/">
				
		Kõikide inimeste sünniaastad:<br /> <!--Provided by Juhan Heinlaid-->
		<xsl:for-each select="//pereliige">
			<xsl:value-of select="nimi"/> (<xsl:value-of select="@synniaasta"/>)<xsl:if test="position() != last()">,<br /></xsl:if>
		</xsl:for-each>.<br/><br/>

		Inimesed, kellel on vähemalt kaks last:<br/>
		<xsl:for-each select="//pereliige">
			<xsl:if test="count(pereliikmed/pereliige) &gt; 1">
				<xsl:value-of select="nimi"/>;<br/>
			</xsl:if>
		</xsl:for-each><br/>

		<table>
			<tr>
				<th>Nimi</th>
				<th>Sünniaasta</th>
				<th>Lapsed</th>
				<th>Vanemad</th>
				<th>Vanavanemad</th>
				<th>Vanus</th>
				<th>Vanema vanus sünnipäeval</th>
			</tr>
			<xsl:for-each select="//pereliige[contains(nimi, $otsing) or string-length(nimi) &gt; $pikkus]">
				<tr style="border: 1px solid black;">
						<td style="border: 1px solid black;">
							
							<xsl:value-of select="nimi"/>
						</td>
						<td style="border: 1px solid black;">
							<xsl:value-of select="@synniaasta"/>
						</td>
						<td style="border: 1px solid black;">
							<xsl:for-each select="*/*">
								<xsl:value-of select="nimi"/>,
							</xsl:for-each>
						</td>
						<td style="border: 1px solid black;">
							<xsl:for-each select="*/*">
								<xsl:value-of select="nimi"/>,
							</xsl:for-each>
						</td>
					<td style="border: 1px solid black;">
						<xsl:value-of select="../../../../nimi"/>
					</td>
					<td style="border: 1px solid black;">
						<xsl:value-of select="2026 - @synniaasta"/>
						<xsl:if test="count(*/pereliige) = 0">
							<xsl:text xml:space="preserve">, Laps</xsl:text>
						</xsl:if>
					</td>
					<td style="border: 1px solid black;">
						<xsl:variable name="lapseVanus" select="2026 - @synniaasta"></xsl:variable>
						<xsl:variable name="vanemaVanus" select="2026 - ../../@synniaasta"></xsl:variable>
						<xsl:value-of select="$vanemaVanus - $lapseVanus"/>
					</td>
				</tr>
			</xsl:for-each>
		</table>
	</xsl:template>
	
</xsl:stylesheet>